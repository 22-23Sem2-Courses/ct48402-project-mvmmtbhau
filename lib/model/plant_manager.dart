import 'package:flutter/foundation.dart';

import './plant_model.dart';

class PlantsManager with ChangeNotifier {
  final List<Plant> _plants = [
    Plant(
      id: '0',
      name: 'Nha Đam',
      imagePath: 'assets/images/nha-dam.jpg',
      category: 'Indoor',
      description:
          'Cây nha đam được mọi người biết đến là một loại nguyên liệu chế biến món ăn. Tuy nhiên, loại cây này còn là một loại cây cảnh độc đáo mang đến công dụng loại sạch độc trong không khí.',
      price: 75.00,
      isFavorite: true,
      isPopular: false,
    ),
    Plant(
      id: '1',
      name: 'Thường Xuân',
      imagePath: 'assets/images/thuong-xuan.jpg',
      category: 'Indoor',
      description:
          'Nằm trong top các loại cây trồng thanh lọc không khí trong nhà, cây thường xuân vẫn là cái tên không thể thiếu. Giống cây cảnh được chính các nhà khoa học của Nasa liệt kê vào danh sách các bộ “máy lọc khí” hiệu quả nhất.',
      price: 25.00,
      isPopular: true,
    ),
    Plant(
      id: '2',
      name: 'Trầu Bà',
      imagePath: 'assets/images/trau-ba.jpg',
      category: 'Garden',
      description:
          'Cây trầu bà thuộc họ dây leo có thân mềm, dễ sống, không cần chăm sóc quá nhiều. Lá cây trầu bà có hình trái tim khá đẹp mắt. Đặc biệt, trầu mà mang lại lợi ích sức khỏe khá lớn.',
      price: 40.00,
      isFavorite: true,
      isPopular: false,
    ),
    Plant(
      id: '3',
      name: 'Vạn Tuế',
      imagePath: 'assets/images/van-tue.jpg',
      category: 'Garden',
      description:
          'Cây vạn tuế thường có gai từ thân đến cành lá, ưa sáng, thích nghi với nhiệt độ cao. Loài cây này có nguồn gốc từ Trung Quốc, Nhật Bản, Ấn Độ, tượng trưng cho sự trường thọ, bình an.',
      price: 50.00,
      isPopular: true,
    ),
    Plant(
      id: '4',
      name: 'Hoa Giấy',
      imagePath: 'assets/images/hoa-giay.jpg',
      category: 'Outdoor',
      description:
          'Hoa giấy có nhiều màu sắc bắt mắt: Hồng, trắng, cam, tím… có thể chịu được đất đai khô cằn nhưng không chịu được lạnh. Nếu trồng và chăm sóc tốt, cắt tỉa và uốn cành phù hợp, chúng ta có thể có được một vườn hoa giấy rực rỡ quanh năm.',
      price: 30.00,
      isPopular: true,
    ),
    Plant(
      id: '5',
      name: 'Cây Si',
      imagePath: 'assets/images/cay-si.jpg',
      category: 'Outdoor',
      description:
          'Cây si thuộc dòng cây bonsai, kích thước lớn hay nhỏ tùy thuộc vào cách chăm sóc và mong muốn của người trồng. Cây si có sức sống mãnh liệt, chịu nắng và nóng rất tốt. Muốn có một cây si đẹp, các bạn nên cắt tỉa, uốn cành, tạo dáng thường xuyên.',
      price: 100.00,
      isFavorite: true,
      isPopular: false,
    ),
    Plant(
      id: '6',
      name: 'Kim Tiền',
      imagePath: 'assets/images/kim-tien.jpg',
      category: 'Office',
      description:
          'Cây kim tiền hay còn được gọi là cây kim phát tài. Trong phong thủy, loại cây này được mệnh danh là một trong những loại cây may mắn nhất đem đến nhiều vận may cũng như tài lộc cho gia chủ. ',
      price: 60.00,
      isFavorite: true,
      isPopular: false,
    ),
    Plant(
      id: '7',
      name: 'Kim Ngân',
      imagePath: 'assets/images/kim-ngan.jpg',
      category: 'Office',
      description:
          'Cây kim ngân hay còn được biết đến với một tên gọi khác là cây tiền. Là loại cây tượng trưng cho tiền bạc, ngân lượng ý chỉ đem đến sự thịnh vượng, vận may và sự giàu có cho gia chủ. ',
      price: 50.00,
      isPopular: true,
    ),
  ];

  void toggleFavoriteStatus(Plant plant) {
    final savedStatus = plant.isFavorite;
    plant.isFavorite = !savedStatus;
  }

  findById(String id) {
    try {
      return _plants.firstWhere((item) => item.id == id);
    } catch (err) {
      return null;
    }
  }

  int get itemCount {
    return _plants.length;
  }

  List<Plant> get plants {
    return [..._plants];
  }

  List<Plant> get favoritePlant {
    return _plants.where((plant) => plant.isFavorite).toList();
  }

  List<Plant> get popularPlant {
    return _plants.where((plant) => plant.isPopular).toList();
  }

  List<Plant> plantByCategory(String category) {
    return _plants.where((plant) => plant.category == category).toList();
  }

  List<Plant> popularPlantByCategory(String category) {
    return _plants
        .where((plant) => plant.category == category && plant.isPopular)
        .toList();
  }
}
