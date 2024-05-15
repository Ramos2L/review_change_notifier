import 'package:flutter/material.dart';
import 'list_mixin.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ListViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  controller.names.isEmpty
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text(
                              'Write name for save:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: controller.names.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                color: Theme.of(context).colorScheme.inversePrimary,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 10,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: controller.names[index].length > 2
                                            ? Text(controller.names[index].substring(0, 2))
                                            : Text(controller.names[index].substring(0, 1)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.names[index],
                                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(),
                          ),
                        ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .1,
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: TextFormField(controller: controllerName),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (controllerName.text.isNotEmpty) {
                          controller.incrementNames(controllerName.text);
                          controllerName.text = '';
                        }
                      },
                      child: const Center(child: Icon(Icons.add, color: Colors.amber)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
