import 'package:flutter/material.dart';
import 'package:parket/ui/list/list_view_model.dart';
import 'package:stacked/stacked.dart';

class OtoparkListView extends StatelessWidget {
  const OtoparkListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListViewModel>.reactive(
        viewModelBuilder: () => ListViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            body: model.isBusy
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: model.myOtoparkSpaces.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: const Icon(Icons.car_rental),
                        title: Text(
                          model.myOtoparkSpaces[index].ad,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),
                        ),
                        subtitle: Row(
                          children: [
                            Text("Ücret : ${model.myOtoparkSpaces[index].ucret} TL"),
                            const Padding(padding: EdgeInsets.only(right: 10)),
                            Text("Kapasite : ${model.myOtoparkSpaces[index].kapasite}")
                          ],
                        ),
                        minVerticalPadding: 15,
                        onTap: (){

                        },
                      );

                    })));
  }
}
