import 'package:flutter/material.dart';

import '../models/device.dart';
import 'rounded_card.dart';
import 'status_badge.dart';

class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({
    super.key,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    final connected = device.status == "device";

    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(
                Icons.phone_android,
                size: 40,
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      device.model,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge,
                    ),

                    Text(
                      device.manufacturer,
                    ),

                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 16),

          Text(
            "Android ${device.version}",
          ),

          const SizedBox(height: 12),

          StatusBadge(
            text: connected ? "Connected" : "Disconnected",
            active: connected,
          ),

        ],
      ),
    );
  }
}