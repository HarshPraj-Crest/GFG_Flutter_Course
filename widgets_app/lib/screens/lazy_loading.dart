import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:widgets_app/widgets/demo_item.dart';

class LazyLoading extends StatefulWidget { 
  const LazyLoading({super.key}); 
  
  
@override
  State<LazyLoading> createState() {
    return _LazyLoadingState();
  } 
 
} 
  
class _LazyLoadingState extends State<LazyLoading> { 
  List<int> data = []; 
  int currentLength = 0; 
  
  final int increment = 10; 
  bool isLoading = false; 
  
  @override 
  void initState() { 
    _loadMore(); 
    super.initState(); 
  } 
  
  Future _loadMore() async { 
    setState(() { 
      isLoading = true; 
    }); 
  
    // Add in an artificial delay 
    await Future.delayed(const Duration(seconds: 2)); 
    for (var i = currentLength; i <= currentLength + increment; i++) { 
      data.add(i); 
    } 
    setState(() { 
      isLoading = false; 
      currentLength = data.length; 
    }); 
  } 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Lazy Loading Screen'), 
      ), 
      body: LazyLoadScrollView( 
        isLoading: isLoading, 
        onEndOfPage: () => _loadMore(), 
        child: ListView.builder( 
          itemCount: data.length, 
          itemBuilder: (context, position) { 
            return DemoItem(position); 
          }, 
        ), 
      ), 
    ); 
  } 
} 
  