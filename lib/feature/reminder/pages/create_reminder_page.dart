import 'package:flutter/material.dart';
import 'package:pill_time/feature/reminder/widgets/default_text_field.dart';

class CreateReminderPage extends StatefulWidget {
  const CreateReminderPage({super.key});

  @override
  State<CreateReminderPage> createState() => _CreateReminderPageState();
}

class _CreateReminderPageState extends State<CreateReminderPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _pillTimeController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Container(),
            ),
            title: const Text(
              "Add med",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  DefaultTextField(
                    controller: _nameController,
                    hintText: "Name of med",
                    type: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Dosage",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  DefaultTextField(
                    controller: _dosageController,
                    hintText: "Dosage",
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pill time",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  DefaultTextField(
                    controller: _pillTimeController,
                    hintText: "Pill time",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Frequency",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  DefaultTextField(
                    controller: _frequencyController,
                    hintText: "Frequency of med",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Observation",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  DefaultTextField(
                    controller: _observationController,
                    hintText: "Observation",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      elevation: 0,
                      highlightElevation: 0,
                      padding: const EdgeInsets.all(15),
                      color: Colors.lightGreen[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onPressed: () => debugPrint(''),
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
