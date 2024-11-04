// import 'package:amazfront/core/database_helper.dart';
// import 'package:amazfront/features/categories/presentation/bloc/crud_handling/crud_handling_bloc.dart';
// import 'package:amazfront/features/products/data/datasource/i_product_datasource.dart';
// import 'package:amazfront/features/products/data/datasource/product_local_datasource.dart';
// import 'package:amazfront/features/products/data/datasource/products_local_datasource.dart';
// import 'package:amazfront/features/products/data/repository/product_repository_impl.dart';
// import 'package:amazfront/features/products/data/repository/products_repository_impl.dart';
// import 'package:amazfront/features/products/domain/repository/product_repository.dart';
// import 'package:amazfront/features/products/domain/repository/products_repository.dart';
// import 'package:amazfront/features/products/presentation/bloc/products_list/products_bloc.dart';
// import 'package:amazfront/features/products/presentation/bloc/crud_handling/crud_handling_bloc.dart';
// import 'package:amazfront/features/products/presentation/helpers/dialog_helper.dart';
// import 'package:amazfront/features/products/presentation/widget/product_item.dart';
// import 'package:amazfront/features/products/presentation/widget/product_search_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductScreen extends StatelessWidget {
//   const ProductScreen({super.key});
//   static const routeName = '/products';

//   @override
//   Widget build(BuildContext context) {
//     final IProductRepository productsRepository = ProductRepositoryImpl(
//       dataSource: ProductLocalDatasource(
//         localDB: AmazFrontDataBaseHelper.instance,
//       ),
//     );
//     return RepositoryProvider.value(
//       value: productsRepository,
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => ProductsBloc(
//               productsRepository: productsRepository,
//             )..add(
//                 const GetProductsEvent(),
//               ),
//           ),
//           BlocProvider(
//             create: (context) => CrudHandlingBloc(
//               productRepository: productsRepository,
//             ),
//           ),
//         ],
//         child: Scaffold(
//           appBar: AppBar(
//             iconTheme: const IconThemeData(
//               color: Colors.white,
//             ),
//             title: const Text(
//               'Products',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 20,
//               ),
//             ),
//             centerTitle: true,
//             elevation: 1,
//             backgroundColor: Colors.blueGrey,
//           ),
//           body: const Padding(
//             padding: EdgeInsets.all(
//               20,
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ProductSearchField(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _ProductListSection(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ProductListSection extends StatefulWidget {
//   const _ProductListSection({super.key});

//   @override
//   State<_ProductListSection> createState() => _ProductListSectionState();
// }

// class _ProductListSectionState extends State<_ProductListSection> {
//   late TextEditingController _editNameController;

//   @override
//   void initState() {
//     super.initState();
//     _editNameController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _editNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: BlocBuilder(
//         bloc: context.read<ProductsBloc>(),
//         builder: (context, state) {
//           final productState = state as ProductsState;
//           if (productState.filteredList.isEmpty) {
//             return const Center(
//               child: Text(
//                 'No products found',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//             );
//           }
//           return ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: productState.filteredList.length,
//             itemBuilder: (context, index) {
//               return ProductItemWidget(
//                 product: state.filteredList[index],
//                 onEdit: () {
//                   showEditProductDialog(
//                     context: context,
//                     title: 'Edit Product name',
//                     onConfirm: () {
//                       context.read<CrudHandlingBloc>().add(
//                             UpdateProductButtonPressed(
//                               product: state.filteredList[index].copyWith(
//                                 name: _editNameController.text,
//                               ),
//                             ),
//                           );
//                       context.read<ProductsBloc>().add(
//                             const GetProductsEvent(),
//                           );
//                       _editNameController.clear();
//                     },
//                     controller: _editNameController,
//                   );
//                 },
//                 onDelete: () {
//                   context.read<CrudHandlingBloc>().add(
//                         DeleteProductButtonPressed(
//                           product: state.filteredList[index],
//                         ),
//                       );
//                   context.read<ProductsBloc>().add(
//                         const GetProductsEvent(),
//                       );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }