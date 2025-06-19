// 资讯数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;

  const InfoItem({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.time,
    required this.navigateUrl,
  });
}
