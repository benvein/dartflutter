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
