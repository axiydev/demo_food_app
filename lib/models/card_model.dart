class ProductMod{
  String? about;
  String? price;
  String? image;
  String? heroTag;
  ProductMod({required this.about,required this.price,required this.image,});
  ProductMod.hero({required this.about,required this.price,required this.image,required this.heroTag});
  String? get getAbout=>this.about;
  String? get getPrice=>this.price;
  String? get getImage=>this.image;
  String? get getHeroTag=>this.heroTag;
}