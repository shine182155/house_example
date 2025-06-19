class RoomDetailData {
  String? id;
  String? title;
  String? community;

  String? subTitle;
  int? size;
  String? floor;
  int? price;
  String? roomType;

  List<String>? houseImgs;
  List<String>? tags;
  List<String>? oriented;

  List<String>? applicances;

  RoomDetailData({
    this.id,
    this.title,
    this.community,
    this.subTitle,
    this.size,
    this.roomType,
    this.houseImgs,
    this.tags,
    this.price,
    this.floor,
    this.oriented,
    this.applicances,
  });
}
