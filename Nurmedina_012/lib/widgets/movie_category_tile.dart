import 'package:flutter/material.dart';
import '../models/movie_category.dart';

class MovieCategoryTile extends StatelessWidget {
  final MovieCategory movieCat;
  final bool isSelected;
  final Function(bool isSelected) onCategorySelected;

  MovieCategoryTile({
    Key? key,
    required this.movieCat,
    required this.isSelected,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategorySelected(!isSelected);
      },
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? const Color(0x803E505A) : const Color(0xFF3E505B),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF506868)
                    : const Color(0xFF8AB0AB),
              ),
              child: Center(
                child: movieCat.imageCat, // Menggunakan gambar langsung
              ),
            ),
            const SizedBox(height: 10),
            Text(
              movieCat.titleCat,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF9BA594)
                    : const Color(0xFFC0CAAD),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
