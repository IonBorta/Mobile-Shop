import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';

class ProductImagesGalery extends StatelessWidget {
  final List<String> imageUrls;
  final int productId;
  final VoidCallback onFavoriteToggle;
  const ProductImagesGalery({super.key, required this.imageUrls, required this.onFavoriteToggle, required this.productId});

  // final List<String> imageUrls = [
  //   "https://img.joomcdn.net/9f71d172ad987354ad6ccb48e371c79cf94a116e_original.jpeg",
  //   "https://img.joomcdn.net/5c7057bf8d61aae173cb3dabd8a6be94249e3595_original.jpeg",
  //   "https://img.joomcdn.net/7f28ca352adbc2e90d551b8c6efea9468020597c_original.jpeg"
  // ];
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480, //MediaQuery.of(context).size.height * 0.5, // Half screen height
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
              return CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.broken_image,size: 100,),
                  ),
                );
                // return imageUrls[index].startsWith("http://127.0.0.1:8000") ? 
                // Placeholder(child: Center(child: Text("NO IMAGE FOUND")),) :
                // Image.network(
                //   imageUrls[index],
                //   fit: BoxFit.cover,
                // );
              },
            ),
          ),
          _Dots(),
          _GoBackIcon(),
          _FavoriteIcon(onFavoriteToggle,productId),
        ],
      ),
    );
  }
}
class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: MediaQuery.of(context).size.width * 0.49,
      child: Text("...", style: TextStyle(color: Colors.black, fontSize: 30)),
    );
  }
}
class _GoBackIcon extends StatelessWidget {
  const _GoBackIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 16,
      child: IconButton.filledTonal(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios, size: 12),
        color: Colors.black,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
        ),
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  final VoidCallback onFavoriteToggle;
  final int productId;
  _FavoriteIcon(this.onFavoriteToggle, this.productId);

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<FavoritesCubit, bool>((cubit) {
      final state = cubit.state;
      if (state is FavoritesLoaded) {
        return state.products.any((p) => p.id == productId);
      }
      return false;
    });
    return Positioned(
      top: 88,
      right: 16,
      child: IconButton.filledTonal(
        onPressed: () => onFavoriteToggle(),
        icon: Icon(
          isFavorite ? Icons.star : Icons.star_border, 
          size: 22
        ),
        color: isFavorite ? Colors.yellow :Colors.black,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(isFavorite ? Colors.green :Colors.white),
        ),
      ),
    );
  }
}
