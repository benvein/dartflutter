import 'package:flutter/material.dart';

enum RoomType { single, double, suite, penthouse }

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HotelState();
  }
}

class _HotelState extends State<Hotel> {
  // --- Radio Button: Room Type ---
  RoomType _selectedRoom = RoomType.single;

  // --- Switches: Services ---
  Map<String, bool> services = {
    'Room Service': false,
    'Airport Shuttle': false,
    'Late Check-out': false,
    'Early Check-in': false,
    'Do Not Disturb': false,
  };

  // --- Checkboxes: Amenities ---
  final List<String> _allAmenities = [
    'Wi-Fi',
    'Swimming Pool',
    'Gym Access',
    'Spa & Wellness',
    'Parking',
    'Breakfast Buffet',
    'Mini Bar',
    'Balcony View',
  ];
  final List<String> _selectedAmenities = [];

  // --- Switches: Special Needs ---
  bool wheelchairAccessible = false;
  bool petFriendly = false;
  bool smokingRoom = false;

  String _roomPrice() {
    switch (_selectedRoom) {
      case RoomType.single:
        return '\$80';
      case RoomType.double:
        return '\$120';
      case RoomType.suite:
        return '\$250';
      case RoomType.penthouse:
        return '\$500';
    }
  }

  void _showBookingSummary() {
    final activeServices = services.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Booking Summary'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Room: ${_selectedRoom.name[0].toUpperCase()}${_selectedRoom.name.substring(1)}  —  ${_roomPrice()} / night',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Services:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (activeServices.isEmpty) const Text('  None'),
              ...activeServices.map((s) => Text('  • $s')),
              const SizedBox(height: 12),
              const Text(
                'Amenities:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (_selectedAmenities.isEmpty) const Text('  None'),
              ..._selectedAmenities.map((a) => Text('  • $a')),
              const SizedBox(height: 12),
              const Text(
                'Special Needs:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '  Wheelchair Accessible: ${wheelchairAccessible ? "Yes" : "No"}',
              ),
              Text('  Pet Friendly: ${petFriendly ? "Yes" : "No"}'),
              Text('  Smoking Room: ${smokingRoom ? "Yes" : "No"}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Booking confirmed! 🎉'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏨 Hotel Booking'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoomTypeSelector(
              selectedRoom: _selectedRoom,
              onChanged: (RoomType value) {
                setState(() {
                  _selectedRoom = value;
                });
              },
            ),
            const HotelDivider(),
            ServicesSelector(
              services: services,
              onChanged: (String key, bool value) {
                setState(() {
                  services[key] = value;
                });
              },
            ),
            const HotelDivider(),
            AmenitiesSelector(
              allAmenities: _allAmenities,
              selectedAmenities: _selectedAmenities,
              onChanged: (String amenity, bool selected) {
                setState(() {
                  if (selected) {
                    _selectedAmenities.add(amenity);
                  } else {
                    _selectedAmenities.remove(amenity);
                  }
                });
              },
            ),
            const HotelDivider(),
            SpecialNeedsSelector(
              wheelchairAccessible: wheelchairAccessible,
              petFriendly: petFriendly,
              smokingRoom: smokingRoom,
              onWheelchairChanged: (value) {
                setState(() {
                  wheelchairAccessible = value;
                });
              },
              onPetFriendlyChanged: (value) {
                setState(() {
                  petFriendly = value;
                });
              },
              onSmokingChanged: (value) {
                setState(() {
                  smokingRoom = value;
                });
              },
            ),
            const SizedBox(height: 24),
            BookButton(onPressed: _showBookingSummary),
            const SizedBox(height: 24),
            const HotelDivider(),
            BookingSummaryTable(
              selectedRoom: _selectedRoom,
              roomPrice: _roomPrice(),
              services: services,
              selectedAmenities: _selectedAmenities,
              wheelchairAccessible: wheelchairAccessible,
              petFriendly: petFriendly,
              smokingRoom: smokingRoom,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// Room Type Selector (Radio Buttons)
// ===========================================================================
class RoomTypeSelector extends StatelessWidget {
  final RoomType selectedRoom;
  final ValueChanged<RoomType> onChanged;

  const RoomTypeSelector({
    super.key,
    required this.selectedRoom,
    required this.onChanged,
  });

  String _roomPriceFor(RoomType room) {
    switch (room) {
      case RoomType.single:
        return '\$80 / night';
      case RoomType.double:
        return '\$120 / night';
      case RoomType.suite:
        return '\$250 / night';
      case RoomType.penthouse:
        return '\$500 / night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Room Type'),
        const SizedBox(height: 4),
        RadioGroup<RoomType>(
          groupValue: selectedRoom,
          onChanged: (RoomType? value) {
            if (value != null) onChanged(value);
          },
          child: Column(
            children: RoomType.values.map((room) {
              return ListTile(
                leading: Radio<RoomType>(value: room),
                title: Text(
                  '${room.name[0].toUpperCase()}${room.name.substring(1)}',
                ),
                trailing: Text(
                  _roomPriceFor(room),
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ===========================================================================
// Services Selector (Switch List)
// ===========================================================================
class ServicesSelector extends StatelessWidget {
  final Map<String, bool> services;
  final void Function(String key, bool value) onChanged;

  const ServicesSelector({
    super.key,
    required this.services,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Services'),
        const SizedBox(height: 4),
        ...services.keys.map((String key) {
          return SwitchListTile(
            title: Text(key),
            value: services[key]!,
            activeThumbColor: Colors.indigo,
            onChanged: (bool value) {
              onChanged(key, value);
            },
          );
        }),
      ],
    );
  }
}

// ===========================================================================
// Amenities Selector (Checkboxes)
// ===========================================================================
class AmenitiesSelector extends StatelessWidget {
  final List<String> allAmenities;
  final List<String> selectedAmenities;
  final void Function(String amenity, bool selected) onChanged;

  const AmenitiesSelector({
    super.key,
    required this.allAmenities,
    required this.selectedAmenities,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Amenities'),
        const SizedBox(height: 4),
        ...allAmenities.map((String amenity) {
          return CheckboxListTile(
            title: Text(amenity),
            value: selectedAmenities.contains(amenity),
            activeColor: Colors.indigo,
            onChanged: (bool? value) {
              onChanged(amenity, value ?? false);
            },
          );
        }),
      ],
    );
  }
}

// ===========================================================================
// Special Needs Selector (Switches)
// ===========================================================================
class SpecialNeedsSelector extends StatelessWidget {
  final bool wheelchairAccessible;
  final bool petFriendly;
  final bool smokingRoom;
  final ValueChanged<bool> onWheelchairChanged;
  final ValueChanged<bool> onPetFriendlyChanged;
  final ValueChanged<bool> onSmokingChanged;

  const SpecialNeedsSelector({
    super.key,
    required this.wheelchairAccessible,
    required this.petFriendly,
    required this.smokingRoom,
    required this.onWheelchairChanged,
    required this.onPetFriendlyChanged,
    required this.onSmokingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Special Needs'),
        const SizedBox(height: 4),
        SwitchListTile(
          title: const Text('Wheelchair Accessible'),
          subtitle: const Text('Ground floor, ramp access'),
          value: wheelchairAccessible,
          activeThumbColor: Colors.indigo,
          onChanged: onWheelchairChanged,
        ),
        SwitchListTile(
          title: const Text('Pet Friendly'),
          subtitle: const Text('Pets allowed in room'),
          value: petFriendly,
          activeThumbColor: Colors.indigo,
          onChanged: onPetFriendlyChanged,
        ),
        SwitchListTile(
          title: const Text('Smoking Room'),
          subtitle: const Text('Room with smoking permitted'),
          value: smokingRoom,
          activeThumbColor: Colors.indigo,
          onChanged: onSmokingChanged,
        ),
      ],
    );
  }
}

// ===========================================================================
// Book Button
// ===========================================================================
class BookButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BookButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.hotel),
        label: const Text('Book Now', style: TextStyle(fontSize: 18)),
        style: FilledButton.styleFrom(backgroundColor: Colors.indigo),
      ),
    );
  }
}

// ===========================================================================
// Shared Widgets
// ===========================================================================
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    );
  }
}

class HotelDivider extends StatelessWidget {
  const HotelDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 32, thickness: 2, color: Colors.black12);
  }
}

// ===========================================================================
// Booking Summary DataTable
// ===========================================================================
class BookingSummaryTable extends StatelessWidget {
  final RoomType selectedRoom;
  final String roomPrice;
  final Map<String, bool> services;
  final List<String> selectedAmenities;
  final bool wheelchairAccessible;
  final bool petFriendly;
  final bool smokingRoom;

  const BookingSummaryTable({
    super.key,
    required this.selectedRoom,
    required this.roomPrice,
    required this.services,
    required this.selectedAmenities,
    required this.wheelchairAccessible,
    required this.petFriendly,
    required this.smokingRoom,
  });

  @override
  Widget build(BuildContext context) {
    // Build rows from all selections
    final List<_SummaryRow> rows = [];

    // Room type (always selected)
    final roomName =
        '${selectedRoom.name[0].toUpperCase()}${selectedRoom.name.substring(1)}';
    rows.add(_SummaryRow(
      category: '🛏️ Room',
      item: roomName,
      detail: '$roomPrice / night',
    ));

    // Active services
    for (final entry in services.entries) {
      if (entry.value) {
        rows.add(_SummaryRow(
          category: '🛎️ Service',
          item: entry.key,
          detail: 'Enabled',
        ));
      }
    }

    // Selected amenities
    for (final amenity in selectedAmenities) {
      rows.add(_SummaryRow(
        category: '✨ Amenity',
        item: amenity,
        detail: 'Included',
      ));
    }

    // Special needs
    if (wheelchairAccessible) {
      rows.add(const _SummaryRow(
        category: '♿ Special Need',
        item: 'Wheelchair Accessible',
        detail: 'Yes',
      ));
    }
    if (petFriendly) {
      rows.add(const _SummaryRow(
        category: '🐾 Special Need',
        item: 'Pet Friendly',
        detail: 'Yes',
      ));
    }
    if (smokingRoom) {
      rows.add(const _SummaryRow(
        category: '🚬 Special Need',
        item: 'Smoking Room',
        detail: 'Yes',
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Your Selections'),
        const SizedBox(height: 8),
        if (rows.length == 1)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Only the room is selected. Pick services, amenities, or special needs to see them here!',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.indigo.shade50),
            dataRowColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => null,
            ),
            border: TableBorder.all(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            columns: const [
              DataColumn(
                label: Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Item',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Detail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
            rows: rows
                .map(
                  (row) => DataRow(
                    cells: [
                      DataCell(Text(row.category)),
                      DataCell(Text(
                        row.item,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )),
                      DataCell(Text(
                        row.detail,
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SummaryRow {
  final String category;
  final String item;
  final String detail;

  const _SummaryRow({
    required this.category,
    required this.item,
    required this.detail,
  });
}
