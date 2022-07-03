import 'package:desa_pintar/data/model/berita_model.dart';
import 'package:flutter/material.dart';
import '../api/api_service.dart';

enum ResultState { Loading, NoData, HasData, Error }

class BeritaProvider extends ChangeNotifier {
  final ApiService apiService;

  BeritaProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late BeritaResult _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  BeritaResult get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.articles.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
