class ItemSelectVM {
 final String id;
 final String name;
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
  ItemSelectVM({required this.id,required this.name});

  factory ItemSelectVM.fromJson(Map<String, dynamic> responseData) {
    return ItemSelectVM(
        id: responseData['id'].toString(),
        name: responseData['name']??'',
        
    );
  }
}