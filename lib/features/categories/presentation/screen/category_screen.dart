import 'package:amazfront/core/database_helper.dart';
import 'package:amazfront/features/categories/data/datasource/categories_local_datasource.dart';
import 'package:amazfront/features/categories/data/repository/categories_repository_impl.dart';
import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';
import 'package:amazfront/features/categories/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:amazfront/features/categories/presentation/bloc/crud_handling/crud_handling_bloc.dart';
import 'package:amazfront/features/categories/presentation/widget/category_item.dart';
import 'package:amazfront/features/categories/presentation/widget/category_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    final ICategoriesRepository categoriesRepository = CategoriesRepositoryImpl(
      localDatasource: CategoriesLocalDatasource(
        localDB: AmazFrontDataBaseHelper.instance,
      ),
    );
    return RepositoryProvider.value(
      value: categoriesRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoriesBloc(
              categoriesRepository: categoriesRepository,
            ),
          ),
          BlocProvider(
            create: (context) => CrudHandlingBloc(
              categoryRepository: categoriesRepository,
            ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.blueGrey,
          ),
          body: const Padding(
            padding: EdgeInsets.all(
              20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategorySearchField(),
                  SizedBox(
                    height: 20,
                  ),
                  _CategoryListSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryListSection extends StatelessWidget {
  const _CategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder(
        bloc: context.read<CategoriesBloc>(),
        builder: (context, state) {
          final categoryState = state as CategoriesState;
          if (categoryState.filteredList.isEmpty) {
            return const Center(
              child: Text(
                'No categories found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            );
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryState.filteredList.length,
            itemBuilder: (context, index) {
              return CategoryItemWidget(
                category: state.filteredList[index],
                onDelete: () {
                  context.read<CrudHandlingBloc>().add(
                        DeleteCategoryButtonPressed(
                          category: state.filteredList[index],
                        ),
                      );
                  context.read<CategoriesBloc>().add(
                        const GetCategoriesEvent(),
                      );
                },
              );
            },
          );
        },
      ),
    );
  }
}
