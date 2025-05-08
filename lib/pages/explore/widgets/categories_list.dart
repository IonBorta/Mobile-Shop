import 'package:flutter/material.dart';

class Category {
  final String icon;
  final String name;

  Category({required this.icon, required this.name});
}
class CategoriesList extends StatelessWidget {

  CategoriesList({super.key});

  final List<Category> categories = [
    Category(icon: "https://kupatana.com/api/v1/filestorage/image/medium/c5bfbd2e1d35f4cdfe581c1afea650d5.png", name: 'Phones'),
    Category(icon: "https://kupatana.com/api/v1/filestorage/image/medium/7140b43f7d4c3587a76f20b01aec81c1.png", name: 'TVs'),
    Category(icon: "https://kupatana.com/api/v1/filestorage/image/medium/8edecebf5cbde4f68e545d2007f81e7b.png", name: 'Laptops'),
    Category(icon: "https://kupatana.com/api/v1/filestorage/image/medium/c5bfbd2e1d35f4cdfe581c1afea650d5.png", name: 'Watches'),
    Category(icon: "https://kupatana.com/api/v1/filestorage/image/medium/c5bfbd2e1d35f4cdfe581c1afea650d5.png", name: 'Audio'),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 24 / 18
          ),
        ),
        SizedBox(height: 18,),
        SizedBox(
          height: 90, 
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 18,),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4F4F4),
                              blurRadius: 20,
                              offset: Offset(0, 6),
                            ),
                          ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: Image.network(
                        category.icon,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(category.name, style: TextStyle(fontSize: 12,height: 16/12,fontWeight: FontWeight.w400)),
                ],
              );
            },
          ),
        )

      ],
    );
  }
}