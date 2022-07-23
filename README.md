## use

#### AListBuilder

```
  List<Map<String, String>> listALevelObj = [
    {'title': 'Vue', 'image': 'assets/Vue.png'},
    {'title': 'Web', 'image': 'assets/Web.png'},
    {'title': 'Flutter', 'image': 'assets/Flutter.png'},
    {'title': 'UnrealEngine', 'image': 'assets/UnrealEngine.png'}
  ];
  listA (){
    return AListBuilder(
      levelObj: listALevelObj,
      backgroundColor: const Color(0xFF2E2E48),
      onPressed: (selectedCategory) {
        debugPrint('click $selectedCategory ');
        setState(() {
          
        });
      },
    );
  }
```
![OneLevel](https://github.com/shAdow-XJY/list_twolevel/blob/master/example/assets/twolevellist2.jpg)

---

#### BListBuilder

```
List<Map<String, String>> listBLevelObj = [
    {'title':'title1'},
    {'title':'title2'},
    {'title':'title3'},
    {'title':'title4'},
    {'title':'title5'},
  ];
  listB (){
    return BListBuilder(
      levelObj: listBLevelObj,
      itemHeight: 50,
      backgroundColor: const Color(0xFF2E2E48),
      onPressed: (selectedTitle) {
        debugPrint('click $selectedTitle ');
        setState(() {
          
        });
      },
    );
  }
```
![TwoLevel](https://github.com/shAdow-XJY/list_twolevel/blob/master/example/assets/twolevellist1.jpg)

## Link

### pub link

[https://pub.dev/packages/list_twolevel](https://pub.dev/packages/list_twolevel)

### use in my blog

click to see:[shAdowPlusing](https://shadowplusing.website/#/)

### code source

Github:[shAdow-XJY/list_twolevel: a two level list builder --- flutter component. (github.com)](https://github.com/shAdow-XJY/list_twolevel)

Gitee:[list_twolevel: a two level list builder --- flutter component. (gitee.com)](https://gitee.com/shAdowPlusing/list_twolevel)