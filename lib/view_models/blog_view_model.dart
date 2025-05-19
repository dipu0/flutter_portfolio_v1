import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:portfolio/models/blog_post.dart';
import 'package:portfolio/config/config.dart';

class BlogViewModel extends ChangeNotifier {
  List<BlogPost> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<BlogPost> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  BlogViewModel() {
    fetchBlogPosts();
  }

  Future<void> fetchBlogPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Use rss2json service to convert Medium RSS feed to JSON to avoid CORS issues
      final username = AppConfig.mediumUsername;
      final response = await http.get(
        Uri.parse('https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@$username'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['status'] == 'ok') {
          final items = data['items'] as List;
          _posts = items.map((item) {
            // Extract a clean excerpt without HTML tags
            var document = parser.parse(item['description']);
            var excerpt = document.body?.text ?? '';
            excerpt = excerpt.length > 150 ? '${excerpt.substring(0, 150)}...' : excerpt;
            
            item['description'] = excerpt;
            return BlogPost.fromJson(item);
          }).toList();
        } else {
          _error = 'Failed to load blog posts: ${data['message']}';
        }
      } else {
        _error = 'Failed to load blog posts. Status code: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error fetching blog posts: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void retry() {
    fetchBlogPosts();
  }
}