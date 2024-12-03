import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<String> items = List.generate(
    10,
    (index) => 'item $index',
  );
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) => setState(() {}),
            style: Theme.of(context).textTheme.titleLarge,
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              fillColor: AppColors.addGrey,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: AppColors.white,
              hintText: 'search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w200),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        _searchController.text.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  const Icon(
                    Icons.local_movies,
                    color: Color(0xffB5B4B4),
                    size: 100,
                  ),
                  Text(
                    'No movies found',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              )
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: AppColors.addGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items[index],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                  itemCount: items.length,
                ),
              )
      ],
    );
  }
}
