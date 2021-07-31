import 'package:flutter/material.dart';
import 'package:hrapp/model/itemSelectVM.dart';
import 'package:hrapp/services/smartApiService.dart';
import 'package:hrapp/ui/widget/AppTheme.dart';
import 'package:hrapp/ui/widget/commonWidget.dart';

class ItemSelectPage extends StatefulWidget {
  const ItemSelectPage({Key key,@required this.title,@required this.url}) : super(key: key);
  final String title;
  final String url;

  @override
  _ItemSelectPageState createState() => _ItemSelectPageState(title:this.title,url:this.url);
}

class _ItemSelectPageState extends State<ItemSelectPage> {
 // final List<String> kEnglishWords;
  _MySearchDelegate _delegate;
  final String title;
  final String url;

  _ItemSelectPageState({@required this.title,@required this.url})
      // : kEnglishWords = List.from(Set.from(['apple', 'hello', 'world', 'flutter']))
      //     ..sort(
      //       (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
      //     ),
        :super();

  @override
  void initState() {
    super.initState();
   // _delegate = _MySearchDelegate(kEnglishWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SmartAppTheme.white,
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        backgroundColor: SmartAppTheme.white,
        title:  Text( this.title, style: SmartAppTheme.lightHeadline),

          iconTheme: IconThemeData(color: SmartAppTheme.iconColor),
        actions: <Widget>[
          IconButton(
            tooltip: 'بحث',
            icon: const Icon(Icons.search),
                      
            onPressed: () async {
              if(this._delegate!=null){
            final ItemSelectVM selected = await showSearch<ItemSelectVM>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('You have selected the word: $selected'),
                //   ),
                // );
              }
              }
          
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: FutureBuilder<ApiListResults<ItemSelectVM>>(
      future:featchItemSelectData(this.url,(row)=>new ItemSelectVM.fromJson(row)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            if(!snapshot.data.success){
          return  errorView(snapshot.data.message);

          }
          List<ItemSelectVM> data = snapshot.data.data;
          if(data.length==0){
          return  noResultViewView();
          }else{
          return _smartListView(context,data);
          }
        } else if (snapshot.hasError) {
          return  errorView(snapshot.error);
        }
         return loadingView();
      
      },
    ),
        // child: ListView.builder(
        //   itemCount: kEnglishWords.length,
        //   itemBuilder: (context, idx) => ListTile(
        //     title: Text(kEnglishWords[idx]),
        //   ),
        // ),
      ),
    );
  }

    ListView _smartListView(BuildContext context,List<ItemSelectVM> data) {
 _delegate = _MySearchDelegate(data);
    return ListView.builder(
      
        itemCount: data.length,
         scrollDirection: Axis.vertical,
          // padding: EdgeInsets.only( left:16,right: 16,bottom: 62 + MediaQuery.of(context).padding.bottom, ),
           itemBuilder: (context, idx) => Column(
             children:[ListTile(
            title: Text(data[idx].name),
            contentPadding:  EdgeInsets.only( left:16,right: 16,bottom: 4,top: 4 ),
            onTap: () {
               Navigator.pop(context, data[idx]);
            },
            
          ),
          Divider()
           ]),
        );
  }

}

// Defines the content of the search page in `showSearch()`.
// SearchDelegate has a member `query` which is the query string.
class _MySearchDelegate extends SearchDelegate<ItemSelectVM> {
  final List<ItemSelectVM> _words;
  final List<ItemSelectVM> _history;
ItemSelectVM selectedItem;
  _MySearchDelegate(List<ItemSelectVM> words)
      : _words = words,
        _history = words,
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'الغاء',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.selectedItem);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<ItemSelectVM> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.name.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (ItemSelectVM suggestion) {
        this.query = suggestion.name;
        this.selectedItem=suggestion;
        this.close(context, suggestion);
       // this._history.insert(0, suggestion);
     //   showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        IconButton(
          tooltip: 'Voice Search',
          icon: const Icon(Icons.mic),
          onPressed: () {
            this.query = 'TODO: implement voice input';
          },
        )
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<ItemSelectVM> suggestions;
  final String query;
  final ValueChanged<ItemSelectVM> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final ItemSelectVM suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.name.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.name.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}