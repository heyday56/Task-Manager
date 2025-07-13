class Note{
  int _id;
  String _title;
  String _description;
  Note(this._id,this._title,this._description);
int get id=>_id;
  String get title=>_title;
  String get description=>_description;
  Map<String,dynamic> toMap(){
  var map=Map<String,dynamic>();
  map['id']=_id;
map['title']=_title;
map['description']=_description;
  return map;
}

}