import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';
import 'package:amazfront/features/categories/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:amazfront/features/categories/presentation/bloc/crud_handling/crud_handling_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySearchField extends StatelessWidget {
  const CategorySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<CategoriesBloc>(context),
        ),
        BlocProvider(
          create: (_) => CrudHandlingBloc(
            categoryRepository: context.read<ICategoriesRepository>(),
          ),
        ),
      ],
      child: const CategorySearchFieldRaw(),
    );
  }
}

class CategorySearchFieldRaw extends StatefulWidget {
  const CategorySearchFieldRaw({super.key});

  @override
  State<CategorySearchFieldRaw> createState() => _CategorySearchFieldState();
}

class _CategorySearchFieldState extends State<CategorySearchFieldRaw> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              context.read<CategoriesBloc>().add(
                    FilterCategoriesEvent(
                      value: value,
                    ),
                  );
            },
            decoration: InputDecoration(
              hintText: 'Search by name',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        BlocConsumer<CrudHandlingBloc, CrudHandlingState>(
          listenWhen: (previous, current) {
            return current is CrudHandlingSuccess &&
                previous is CrudHandlingLoading;
          },
          listener: (context, state) {
            context.read<CategoriesBloc>().add(
                  const GetCategoriesEvent(),
                );
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<CrudHandlingBloc>().add(
                      CreateCategoryButtonPressed(
                        name: _controller.value.text,
                      ),
                    );
                _controller.clear();
              },
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
              ),
            );
          },
        ),
      ],
    );
  }
}
