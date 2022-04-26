import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controller/pokemon_controller.dart';

class PokemonHomePage extends StatelessWidget {
  PokemonController pokemonController = Get.put(PokemonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (pokemonController.isLoading.value) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: pokemonController.pokemonList!.pokemon!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        width: 100,
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                  '${pokemonController.pokemonList!.pokemon![index].img}'),
                              Text(
                                  '${pokemonController.pokemonList!.pokemon![index].name}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
