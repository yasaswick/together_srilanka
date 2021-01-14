import 'package:cloud_firestore/cloud_firestore.dart';

class News{

String newsId;
String newsTitle;
String newsSubTitle;
String newsImage;
String newsProvider;
int newsTime;


News({this.newsId , this.newsTitle , this.newsSubTitle , this.newsImage , this.newsProvider , this.newsTime});

factory News.fromDocumentSnapshot(DocumentSnapshot doc){
  return News(
    newsId: doc.data['newsId'],
    newsTitle: doc.data['newsTitle'],
    newsSubTitle: doc.data['newsSubTitle'],
    newsImage: doc.data['newsImage'],
    newsProvider: doc.data['newsProvider'],
    newsTime: doc.data['newsTime']
  );
}

}