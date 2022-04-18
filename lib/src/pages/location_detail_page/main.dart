import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/pages/location_detail_page/telephone_section.dart';
import '../../database/tables/location.dart';
import '../../database/database_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'title_section.dart';
import 'button_section.dart';
import 'description_section.dart';
import 'mit_der_card_section.dart';
import 'navigation_section.dart';
import 'open_section.dart';
import 'telephone_section.dart';
import 'mail_section.dart';
import 'webpage_section.dart';
import 'check_dialog.dart';
import 'dart:math' as math;

class LocationDetailsPage extends StatefulWidget {
  const LocationDetailsPage({Key? key, required this.id}) : super(key: key);
  final int id;
  static const routeName = '/location/';

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();
}

/// Displays detailed information about a SampleItem.
class _LocationDetailsPageState extends State<LocationDetailsPage> {
  late Future<Location> _location;
  @override
  void initState() {
    super.initState();

    _location = DatabaseHelper.getLocationToId(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ReRunnableFutureBuilder(location: _location, onRerun: _runFuture);
  }

  _runFuture() {
    _location = DatabaseHelper.getLocationToId(id: widget.id);
    setState(() {});
  }
}

class ReRunnableFutureBuilder extends StatelessWidget {
  const ReRunnableFutureBuilder(
      {Key? key, required this.location, required this.onRerun})
      : super(key: key);

  final Future<Location> location;
  final Function onRerun;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: location,
      builder: (BuildContext context, AsyncSnapshot<Location?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final location = snapshot.data as Location;
            return LocationDetailView(location: location, onRerun: onRerun);
        }
      },
    );
  }
}

/// Displays detailed information about a SampleItem.
class LocationDetailView extends StatelessWidget {
  const LocationDetailView(
      {Key? key, required this.location, required this.onRerun})
      : super(key: key);

  final Location location;
  final Function onRerun;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(location.name),
          actions: [
            IconButton(
                icon: const Icon(
                  MdiIcons.check,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => const CheckDialog());
                }),
            IconButton(
              icon: Icon(
                location.favorit ? MdiIcons.star : MdiIcons.starOutline,
              ),
              onPressed: () {
                location.favorit
                    ? _favUnfavLocation(location, false, onRerun)
                    : _favUnfavLocation(location, true, onRerun);
              },
            ),
            IconButton(
              icon: const Icon(
                MdiIcons.map,
              ),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TitleSection(location: location),
                  const SizedBox(height: 10),
                  DescriptionSection(location: location),
                  const SizedBox(height: 10),
                  MitDerCardSection(location: location),
                  const SizedBox(height: 15),
                  ButtonSection(location: location, bcol: [
                    ButtonCol(
                        color: color,
                        icon: MdiIcons.phone,
                        label: 'CALL',
                        onPressed: () {
                          _launchTel(location.telephone);
                        }),
                    ButtonCol(
                        color: color,
                        icon: MdiIcons.email,
                        label: 'MAIL',
                        onPressed: () {
                          _launchMail(location.email);
                        }),
                    ButtonCol(
                        color: color,
                        icon: MdiIcons.earth,
                        label: 'WEBPAGE',
                        onPressed: () {
                          _launchWeb(location.website);
                        }),
                    ButtonCol(
                        color: color,
                        icon: MdiIcons.navigation,
                        label: 'NAVI',
                        onPressed: () {
                          _launchNav(location.latitude, location.longitude);
                        }),
                    ButtonCol(
                        color: color,
                        icon: location.favorit
                            ? MdiIcons.star
                            : MdiIcons.starOutline,
                        label: 'FAV',
                        onPressed: () {
                          location.favorit
                              ? _favUnfavLocation(location, false, onRerun)
                              : _favUnfavLocation(location, true, onRerun);
                        }),
                  ]),
                  const Divider(),
                  const SizedBox(height: 8),
                  NavigationSection(
                      location: location,
                      onPressed: () {
                        _launchNav(location.latitude, location.longitude);
                      }),
                  const SizedBox(height: 8),
                  OpenSection(location: location),
                  const SizedBox(height: 8),
                  TelephoneSection(
                      location: location,
                      onPressed: () {
                        _launchTel(location.telephone);
                      }),
                  const SizedBox(height: 8),
                  MailSection(
                      location: location,
                      onPressed: () {
                        _launchMail(location.email);
                      }),
                  const SizedBox(height: 8),
                  WebpageSection(
                      location: location,
                      onPressed: () {
                        _launchWeb(location.website);
                      })
                ],
              ))),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {
              _launchTel(location.telephone);
            },
            icon: const Icon(MdiIcons.phone),
          ),
          ActionButton(
            onPressed: () {
              _launchMail(location.email);
            },
            icon: const Icon(MdiIcons.email),
          ),
          ActionButton(
            onPressed: () {
              _launchWeb(location.website);
            },
            icon: const Icon(MdiIcons.earth),
          ),
          ActionButton(
            onPressed: () {
              _launchNav(location.latitude, location.longitude);
            },
            icon: const Icon(MdiIcons.navigation),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void _launchTel(String tel) async {
  if (tel.startsWith('tel')) {
    _launchURL(tel);
  } else {
    final Uri telLaunchUri = Uri(
      scheme: 'tel',
      path: tel,
    );
    _launchURL(telLaunchUri.toString());
  }
}

void _launchMail(String email) async {
  if (email.startsWith('mailto')) {
    _launchURL(email);
  } else {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    _launchURL(emailLaunchUri.toString());
  }
}

void _launchWeb(String http) async {
  if (http.startsWith('http')) {
    _launchURL(http);
  } else {
    final Uri webLaunchUri = Uri(
      scheme: 'https',
      path: http,
    );
    _launchURL(webLaunchUri.toString());
  }
}

void _launchNav(double lat, double lon) async {
  MapsLauncher.launchCoordinates(lat, lon);
}

void _favUnfavLocation(Location location, bool fav, Function onRerun) async {
  await DatabaseHelper.setFavUnfav(location, fav);
  await onRerun();
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          color: Theme.of(context).colorScheme.onSecondary,
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(MdiIcons.informationOutline),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
