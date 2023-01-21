import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../logic/profile_cubit.dart';
import '../../logic/profile_states.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final ProfileCubit cubit = context.read<ProfileCubit>();
        final user = cubit.data.user;
        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 125,
                height: 125,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.3,
                        cornerStyle: CornerStyle.bothCurve,
                        color: const Color(0xff3E3535).withOpacity(0.2),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          gradient: SweepGradient(
                            colors: [
                              Color(0xffFF4141),
                              Color(0xffDED84A),
                              Color(0xff27EC40),
                              Color(0xff1DFF00),
                            ],
                          ),
                          value: user.rating! * 10.0,
                          color: Colors.white,
                          cornerStyle: CornerStyle.startCurve,
                          width: 0.3,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 111,
                height: 111,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Image.asset(
                      cubit.data.user.photoUrl!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 111,
                height: 120,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xff0D9C13),
                          Color(0xff27F710),
                        ]),
                        borderRadius: BorderRadius.circular(
                          13,
                        )),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cubit.data.user.rating!.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              letterSpacing: 0.24,
                              color: Colors.white,
                            ),
                          ),
                          const Center(
                            child: Icon(
                              Icons.star_rounded,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
