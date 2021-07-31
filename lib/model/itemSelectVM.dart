class ItemSelectVM {
  String id;
  String name;
 // String email;
 // String phone;
 // String type;
  //String renewalToken;
  toJson(){
    return {
        'id': id,
        'name': name,
      };
 }
  ItemSelectVM({this.id, this.name});

  factory ItemSelectVM.fromJson(Map<String, dynamic> responseData) {
    return ItemSelectVM(
        id: responseData['id'].toString(),
        name: responseData['name']??'',
        
    );
  }
}