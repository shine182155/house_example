import '../../models/InfoItem.dart';
import 'compoment/body/Index_recommendItem.dart';

class TabHomeState {
  late List<IndexRecommendItem> list;
  late List<String> carouselImages;
  late List<InfoItem> infoItems;
  String cityName  =  "北京";
  String searchName  =  "北京";

  TabHomeState() {
    ///Initialize variables
    list = [
      const IndexRecommendItem(
        '家住回龙观',
        '归属的感觉',
        'static/images/home_index_recommend_1.png',
        'login',
      ),
      const IndexRecommendItem(
        '宜居四五环',
        '大都市生活',
        'static/images/home_index_recommend_2.png',
        'login',
      ),
      const IndexRecommendItem(
        '喧嚣三里屯',
        '繁华的背后',
        'static/images/home_index_recommend_3.png',
        'login',
      ),
      const IndexRecommendItem(
        '比邻十号线',
        '地铁心连心',
        'static/images/home_index_recommend_4.png',
        'login',
      ),
    ];
    carouselImages = [
      'https://pic1.ajkimg.com/display/anjuke/14ccbe-%E8%80%80%E8%AF%9A%E6%88%BF%E5%9C%B0%E4%BA%A7/284d9fc9f77f443c955ed6b78a306472-800x650.jpg',
      'https://pic1.ajkimg.com/display/ajk/5fd5558676ccf9e61a3a9ccbbf7172df/800x650.jpg',
      'https://pic1.ajkimg.com/display/anjuke/adefd3-%E4%BF%A1%E5%88%99/7d10fc08da7d805cec1465b1c8b3b8f4-800x650.jpg',
    ];
     infoItems = [
       InfoItem(
          title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
          imageUrl:
          'https://pic1.ajkimg.com/display/anjuke/d6c59a-%E8%AF%9A%E5%BE%B7%E5%A5%BD%E6%88%BF/9de32163eccd60923fe7975a28dc6479-800x650.jpg',
          source: "新华网",
          time: "两天前",
          navigateUrl: 'login'),
       InfoItem(
          title: '置业选择 | 珠江新城 三室一厅 广州的隔江眺望',
          imageUrl:
          'https://pic1.ajkimg.com/display/anjuke/14ccbe-%E8%80%80%E8%AF%9A%E6%88%BF%E5%9C%B0%E4%BA%A7/284d9fc9f77f443c955ed6b78a306472-800x650.jpg',
          source: "新华网",
          time: "两天前",
          navigateUrl: 'login'),
       InfoItem(
          title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
          imageUrl:
          'https://pic1.ajkimg.com/display/anjuke/78a5a4-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/5db66aaad87cd0f093b0099b5d4ad64a-800x650.jpg',
          source: "新华网",
          time: "两天前",
          navigateUrl: 'login'),
       InfoItem(
          title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
          imageUrl:
          'https://pic1.ajkimg.com/display/ajk/5fd5558676ccf9e61a3a9ccbbf7172df/800x650.jpg',
          source: "新华网",
          time: "两天前",
          navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:
           'https://tva1.sinaimg.cn/large/008i3skNgy1gsu67i9v77j30io0cejt4.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:
           'https://tva1.sinaimg.cn/large/008i3skNgy1gsu65bbztrj30ks0cugmw.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:
           'https://tva1.sinaimg.cn/large/008i3skNgy1gsu68f9pyuj30m20ccgnp.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:
           'https://pic1.ajkimg.com/display/anjuke/2660e5-%E4%BF%A1%E5%88%99/e637cfef1ed2b17713d5460430e57d08-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:
           'https://pic1.ajkimg.com/display/anjuke/a7e9c3-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/f1583576bf47ca0b7748ac5b86e82a3f-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl:'https://pic1.ajkimg.com/display/anjuke/8bccf4-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/758ebe9b907b957475597da20fb93f6d-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
            imageUrl:'https://pic1.ajkimg.com/display/anjuke/9be656-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/047932f603186146d02a896ca26f0e44-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl: 'https://pic1.ajkimg.com/display/anjuke/01bc41-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/1a4a92fa70dc3f8a626bd50c80d6f717-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl: 'https://pic1.ajkimg.com/display/anjuke/569d80-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/6a18f288e0cf0144bfa6c6ce78538963-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),
       InfoItem(
           title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
           imageUrl: 'https://pic1.ajkimg.com/display/anjuke/edb1ce-%E6%B1%87%E5%A4%A9%E5%88%9B%E6%88%BF%E5%9C%B0%E4%BA%A7/a828bef3b3ef1eec0995453c45525811-800x650.jpg',
           source: "新华网",
           time: "两天前",
           navigateUrl: 'login'),

     ];
  }
}
