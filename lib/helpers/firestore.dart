
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:together_we_fight/models/news.dart';



class FirestoreDb {

//Collection references
CollectionReference _newsCollection = Firestore.instance.collection('news');



//method to retrive list of reports
Stream<List<News>> get newsList{
  return _newsCollection.snapshots().map((list)=> list.documents.map((doc) => News.fromDocumentSnapshot(doc)).toList());
}


}