import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nazerin_project/ruler_map/bloc/bloc.dart';
import 'package:nazerin_project/ruler_map/widget/customdialog.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GmapPage extends StatefulWidget {
  const GmapPage({Key? key}) : super(key: key);

  @override
  State<GmapPage> createState() => _GmapPageState();
}

class _GmapPageState extends State<GmapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! using stack widget to set all widgets in one =================
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            // ignore: sized_box_for_whitespace
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Consumer<ProviderMaps>(
                    builder: (context, provmaps, widget) {
                  //!Changing location properties from false to true and adding permisions to android manif file for test them=======
                  return GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    compassEnabled: true,
                    mapType: MapType.normal,
                    markers: provmaps.markers,
                    polylines: provmaps.polyline,
                    polygons: provmaps.polygon,
                    initialCameraPosition:
                        //!changing initialposition to tehran=======
                        CameraPosition(target: provmaps.initialPos, zoom: 11.0),
                    onMapCreated: provmaps.onCreated,
                    onTap: provmaps.addMarker,
                  );
                })),
          ),

          //! gess Setting method and icon for ruler =========
          Consumer<ProviderMaps>(builder: (context, menu, widget) {
            return AnimatedPositioned(
              bottom: menu.menu == false ? 16 : 150,
              right: 16,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                heroTag: 'fmnu',
                elevation: 1,
                onPressed: menu.changestatupolyli,
                backgroundColor: menu.selectpolyli == false
                    ? Colors.white
                    : Colors.blueAccent,
                child: Icon(MdiIcons.ruler,
                    color: menu.selectpolyli == false
                        ? Colors.black
                        : Colors.white),
              ),
            );
          }),

          //!Method and ICon for selecting area ==============
          Consumer<ProviderMaps>(builder: (context, menu, widget) {
            return AnimatedPositioned(
              bottom: menu.menu == false ? 16 : 80,
              right: 16,
              duration: const Duration(milliseconds: 200),
              child: FloatingActionButton(
                heroTag: 'fme',
                elevation: 1,
                onPressed: menu.changestatutpolyg,
                backgroundColor: menu.selectpolyg == false
                    ? Colors.white
                    : Colors.blueAccent,
                child: Icon(MdiIcons.vectorPolygon,
                    color: menu.selectpolyg == false
                        ? Colors.black
                        : Colors.white),
              ),
            );
          }),

          //!For setting color Icon nexto selecting area Icon ===========
          Positioned(
            bottom: 80,
            right: 90,
            child:
                Consumer<ProviderMaps>(builder: (context, pickercolor, widget) {
              return pickercolor.selectpolyg == false
                  ? Container()
                  : FloatingActionButton(
                      heroTag: 'fpc',
                      onPressed: pickercolor.changeColor,
                      backgroundColor: pickercolor.color,
                      shape: const CircleBorder(
                          side: BorderSide(width: 5, color: Colors.white))

                      //color.changeColor
                      );
            }),
          ),

          //!method for check icon================
          Positioned(
            bottom: 80,
            child: Consumer<ProviderMaps>(builder: (context, color, widget) {
              return color.selectpolyg == false
                  ? Container()
                  : FloatingActionButton(
                      heroTag: 'fc',
                      onPressed: color.calcarea,
                      child:
                          const Icon(MdiIcons.check, color: Colors.blueAccent),
                      backgroundColor: Colors.white,
                      //color.changeColor
                    );
            }),
          ),

          //!First Floating actionbut befor open==============
          Positioned(
              bottom: 16,
              right: 16,
              child: Consumer<ProviderMaps>(builder: (context, menu, widget) {
                return FloatingActionButton(
                  heroTag: 'fm',
                  onPressed: menu.changemenu,
                  backgroundColor: Colors.blueAccent,
                  child:
                      Icon(menu.menu == false ? MdiIcons.menu : MdiIcons.close),
                );
              })),
          Consumer<ProviderMaps>(builder: (context, dialg, widget) {
            return dialg.customdialog == false
                ? Container()
                : const CustomDialog();
          }),
        ],
      ),
    );
  }
}
