import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../theme/themeProvider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Builder(builder: (context) {
          Brightness brightness = Theme.of(context).brightness;
          return AppBar(
            title: Text(
              'Setting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey.shade700,
            ),
            elevation: 0,
            centerTitle: true,
          );
        }),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                // border: TableBorder.all(color: Colors.grey),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: IntrinsicColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.language,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Language',
                          ),
                        ),
                      ),
                      TableCell(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey.shade700,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.color_lens_rounded,
                          color: Colors.grey.shade700,
                        ),
                      ), // Remove the additional Padding widget here
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Theme (Light/Dark)",
                          ),
                        ),
                      ),
                      TableCell(
                        child: Switch(
                          value:
                              Provider.of<ThemeProvider>(context).themeData ==
                                  darkMode,
                          activeColor: Theme.of(context).colorScheme.primary,
                          onChanged: (bool value) {
                            final themeProvider = Provider.of<ThemeProvider>(
                                context,
                                listen: false);
                            themeProvider.toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
