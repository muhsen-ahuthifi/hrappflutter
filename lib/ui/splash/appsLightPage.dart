
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/providers/user_provider.dart';
import 'package:hrapp/ui/home/homeLightPage.dart';
// import 'package:hrapp/ui/home/homeLightPage.dart';
import 'package:hrapp/util/homeSysKey.dart';

import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/util/shared_preference.dart';
import 'package:provider/provider.dart';

class AppsLightPage extends StatefulWidget {
  AppsLightPage({Key key}) : super(key: key);

  final String title="الاجازات والتقييم";

  @override
  _AppsLightPageState createState() => _AppsLightPageState();
}

class _AppsLightPageState extends State<AppsLightPage> {
  List<NavItem> navs;
    TextEditingController _controller;
    FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
        super.initState();

   navs = getNavItems();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }
    @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

 void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

 // Search the product catalog
  List<NavItem> search(String searchTerms) {
    return navs.where((item) {
      return item.title.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }
 Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   //   final model = Provider.of<AppStateModel>(context);
    final resultsNavs =_terms==null||_terms.isEmpty?navs:search(_terms);

  
    
 
   return DecoratedBox(
      decoration: const BoxDecoration(
        color: SmartAppTheme.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
          
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => MenuRowItem(
                  
                   item: resultsNavs[index],
                  lastItem: index == resultsNavs.length - 1,
                  ),
                itemCount: resultsNavs.length,
              ),
            ),
          ],
        ),
      ),
    );
   
  //   return CupertinoPageScaffold(
    
  //    backgroundColor: SmartAppTheme.background,
        
  // //    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  //     navigationBar: CupertinoNavigationBar(
  //  //   elevation: 0.1,
  //          middle:  Text( widget.title, style: SmartAppTheme.lightHeadline),

  //   //  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  //    //iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
  //     // backgroundColor:SmartAppTheme.background,
        
  //         //   actions: [
  //         //     PopupMenuButton(
  //         //       itemBuilder: (BuildContext context){
  //         //  return  [
  //         //       const PopupMenuItem(value: 'Aboute',child: Text('عنا')),
  //         //         const PopupMenuItem(value: 'Logout',child: Text('تسجيل خروج'))
  //         //         ];
  //         //       },
  //         //       onSelected: (value) =>_onMenuOptionSelected(context,value),
                
  //         //     ), 
              
  //         //   ],
  //   ),

  //     child: Container(
        
  //     // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
  //     child: ListView.builder(
  //     // semanticChildCount:  navs.length,
  //     //  addSemanticIndexes: true,
  //    //   addSemanticIndexes: true,
  //       scrollDirection: Axis.vertical,
  //       //shrinkWrap: true,
  //       itemCount: resultsNavs.length,
  //       itemBuilder: (context, index) {
  //         return makeCard(resultsNavs[index]);
  //       },
  //     ),
  //   ),
  //   //  bottomNavigationBar: makeBottom,
  //   );
  }

//            _onMenuOptionSelected(BuildContext context,value){
//               {
      
//                   if(value=='Logout'){
                     
//                    smartConfirmDialog(context,"تسجيل الخروج","تاكيد تسجيل الخروج",()=>{
//                      UserPreferences().removeUser(),
//                       Provider.of<UserProvider>(context, listen: false).removeUser(),
//                       Navigator.pushReplacementNamed(context, '/login'),

//                    });
//                  //showToastMsg(context,'menu',value.toString())
//                   }
//                   else
//                   {
//                     smartErrorToast(context,'menu',value.toString());
//                   }
                 
//                 };
//  }


}



class SearchBar extends StatelessWidget {
  const SearchBar({
    @required this.controller,
    @required this.focusNode,
    Key key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return 
    Row(
          children: [
          
            Expanded(
              child: 
                ExcludeSemantics(
              child:
            
    DecoratedBox(
      decoration: BoxDecoration(
        color: SmartAppTheme.searchBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: SmartAppTheme.searchIconColor,
            ),
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                style: SmartAppTheme.searchText,
                placeholder: 'بحث',
                cursorColor: SmartAppTheme.searchCursorColor,
                decoration: null,
              ),
            ),
                  
            GestureDetector(
              onTap: controller.clear,
              child: 
         const Icon(
                CupertinoIcons.clear_thick_circled,
                color: SmartAppTheme.searchIconColor,
              ),
            ),
          ],
        ),
     ),
    ))),
    
     Padding(
        padding: const EdgeInsets.symmetric( horizontal: 8,vertical: 0 ),
        child: 
        Semantics(
        label: "تسجيل الخروج",
          child:
        
        GestureDetector(
        
              onTap:(){
                 showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('تاكيد تسجيل الخروج'),
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('الغاء'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
              // message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    
                    child: const Text('تسجيل خروج'),
                    onPressed: () {
                        UserPreferences().removeUser();
                      Provider.of<UserProvider>(context, listen: false).removeUser();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                
                ],
              ),
            );
         
              },
              child: const Icon(
                
                Icons.logout,
                color: SmartAppTheme.searchIconColor,
              ),
            ) )),
    ]
    );
  }
}
      
  

  
class MenuRowItem extends StatelessWidget {
  const MenuRowItem({
    @required this.item,
   @required this.lastItem,
    Key key,
  }) : super(key: key);

  final NavItem item;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
     
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    item.title,
                    style: SmartAppTheme.menuRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 4)),
                    Text(item.subtitle,
                        style:SmartAppTheme.subtitle),
                ],
              ),
            ),
        
          // CupertinoButton(
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
          //     final model = Provider.of<AppStateModel>(context, listen: false);
          //     model.addProductToCart(product.id);
          //   },
          //   child: const Icon(
          //     CupertinoIcons.plus_circled,
          //     semanticLabel: 'Add',
          //   ),
          // ),
      
    
    );

    // if (lastItem) {
    //   return row;
    // }

    return
       Material(
          child: InkWell(
            onTap: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  HomeLightPage(navItem: item)));
            
          },
       child:
     Column(
      
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: SmartAppTheme.menuRowDivider,
          ),
        ),
      ],
    )));
  }
}



