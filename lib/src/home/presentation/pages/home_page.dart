import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/activity/domain/entities/activity.dart';
import '../../../../core/activity/presentation/bloc/activity_bloc.dart';
import '../../../../core/data/svgs.dart';
import '../../../../core/util/activity_helper.dart';
import '../../../../injection_container.dart';
import '../../../medication/presentation/bloc/medication_bloc.dart';
import '../../../medication/presentation/widgets/card.dart';
import '../../../medication/presentation/widgets/tracking.dart';
import '../widgets/card.dart';
import '../widgets/item.dart';
import '../widgets/section.dart';

class _HomeMenuItem {
  const _HomeMenuItem(
      {required this.activity, required this.icon, required this.color});
  final Activity activity;
  final String icon;
  final Color color;
}

/// Home Page
class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({super.key});

  /// Home menu items
  static final menuItems = <_HomeMenuItem>[
    _HomeMenuItem(
        activity: Activity.initial().copyWith(type: ActivityType.visit),
        icon: SvgAssets.visits,
        color: const Color(0xff22D3EE)),
    _HomeMenuItem(
        activity: Activity.initial().copyWith(type: ActivityType.medication),
        icon: SvgAssets.medications,
        color: const Color(0xff60A5FA)),
    _HomeMenuItem(
        activity: Activity.initial().copyWith(type: ActivityType.vaccination),
        icon: SvgAssets.vaccinations,
        color: const Color(0xffFACC15))
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final activityBloc = sl<ActivityBloc>();
  final medicationBloc = sl<MedicationBloc>();

  final controller = PageController(viewportFraction: 0.6);

  final trackingController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    activityBloc.add(ActivityDataRequested());
    medicationBloc.add(MedicationDataRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello Shmuel',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(SvgAssets.search)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(children: [
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(SvgAssets.bell)),
                Positioned(
                  right: 5,
                  top: 2,
                  child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle)),
                )
              ]),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
          child: const Icon(Icons.grid_view_outlined, color: Colors.white),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 160,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: HomePage.menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HomeMenuItem(
                      activity: HomePage.menuItems[index].activity,
                      icon: HomePage.menuItems[index].icon,
                      color: HomePage.menuItems[index].color,
                    );
                  },
                ),
              ),
              BlocBuilder<ActivityBloc, ActivityState>(
                bloc: activityBloc,
                builder: (context, state) {
                  if (state is ActivityDataLoaded &&
                      state.activities.isNotEmpty) {
                    final groupedActivities = state.activities;

                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                                child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Upcoming',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  children: [
                                    TextSpan(
                                        text:
                                            '\n${groupedActivities.entries.fold(0, (previousValue, element) => element.value.length + previousValue)} Activities',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold))
                                  ]),
                            )),
                            SfCircularChart(
                              series: <CircularSeries<
                                  MapEntry<ActivityType, List<Activity>>,
                                  String>>[
                                DoughnutSeries(
                                    dataSource:
                                        groupedActivities.entries.toList(),
                                    pointColorMapper: (data, _) =>
                                        ActivityHelper.colorForType(data.key),
                                    xValueMapper: (data, _) => data.key.name,
                                    yValueMapper: (data, _) =>
                                        data.value.length,
                                    dataLabelMapper: (data, _) =>
                                        data.value.length.toString(),
                                    dataLabelSettings: DataLabelSettings(
                                        labelPosition:
                                            ChartDataLabelPosition.outside,
                                        labelIntersectAction:
                                            LabelIntersectAction.hide,
                                        connectorLineSettings:
                                            const ConnectorLineSettings(
                                                type: ConnectorType.curve),
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    radius: '100%',
                                    innerRadius: '70%')
                              ],
                            ),
                          ],
                        ),
                        ...groupedActivities.entries.map((e) => Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ExpansionTile(
                                collapsedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.white,
                                collapsedBackgroundColor: Colors.white,
                                title: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ActivityCard(
                                        color:
                                            ActivityHelper.colorForType(e.key),
                                        icon: ActivityHelper.iconForType(e.key),
                                        activity: Activity.initial()
                                            .copyWith(type: e.key),
                                        isListTile: true),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text('Future ${e.key.name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(
                                  width: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  ActivityHelper.colorForType(
                                                      e.key),
                                              child: Text(
                                                  e.value.length.toString()))),
                                      const Expanded(
                                          child: Icon(Icons
                                              .keyboard_arrow_down_rounded))
                                    ],
                                  ),
                                ),
                                children: const [
                                  ListTile(
                                    leading:
                                        Icon(Icons.domain_verification_rounded),
                                    title: Text('Appointment with Dr. Smith'),
                                  )
                                ],
                              ),
                            )),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                },
              ),
              BlocBuilder<MedicationBloc, MedicationState>(
                bloc: medicationBloc,
                builder: (context, state) {
                  if (state is MedicationDataLoaded &&
                      state.medications.isNotEmpty) {
                    return HomeSection(
                        controller: controller,
                        title: 'Active Medications',
                        items: state.medications
                            .map((e) => MedicationCard(
                                title: e.name,
                                dosage: e.dosage,
                                frequency: e.frequency,
                                consumptionPeriods: e.consumptionPeriod))
                            .toList());
                  }
                  return Center(
                      child: CircularProgressIndicator.adaptive(
                    backgroundColor: Theme.of(context).primaryColor,
                  ));
                },
              ),
              HomeSection(
                  controller: trackingController,
                  title: 'Tracking Measures',
                  showMore: true,
                  height: 180,
                  items: const [TrackingCard(), TrackingCard()]),
            ]),
          ),
        ));
  }
}
