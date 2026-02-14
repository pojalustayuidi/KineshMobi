import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';

class SelectedStopHeader extends StatelessWidget {
  final Stop selectedStop;
  final VoidCallback onTapChange;
  final VoidCallback onTapClear;

  const SelectedStopHeader({
    super.key,
    required this.selectedStop,
    required this.onTapChange,
    required this.onTapClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ВАША ОСТАНОВКА',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Franklin_Gothic_Medium',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
              InkWell(
                onTap: onTapChange,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'СМЕНИТЬ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Franklin_Gothic_Medium',
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue[700],
                  size: 20,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedStop.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Franklin_Gothic_Medium',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    if (selectedStop.id != -1)
                      Text(
                        'ID: ${selectedStop.id}',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Franklin_Gothic_Medium',
                          color: Colors.grey[500],
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTapClear,
                icon: Icon(
                  Icons.close,
                  color: Colors.grey[500],
                  size: 20,
                ),
                splashRadius: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}