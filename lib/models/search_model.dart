
class SearchMainCategoryModel {
  int mainCategoryId;
  String mainCategoryTitle;
  String mainCategoryImageUrl;

  SearchMainCategoryModel({
    required this.mainCategoryId,
    required this.mainCategoryTitle,
    required this.mainCategoryImageUrl,
  });
}

class SearchSubCategoryModel {
  int subCategoryId;
  String subCategoryTitle;
  String subCategoryImageUrl;
  SearchSubCategoryModel({

    required this.subCategoryId,
    required this.subCategoryTitle,
    required this.subCategoryImageUrl,
});
}

class SearchChildCategoryModel {

  int childCategoryId;
  String childCategoryTitle;
  String childCategoryImageUrl;
  SearchChildCategoryModel({
    required this.childCategoryId,
    required this.childCategoryTitle,
    required this.childCategoryImageUrl,});
}