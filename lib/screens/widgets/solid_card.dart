part of 'widgets.dart';

class SolidCard extends StatelessWidget {
  final String text;
  const SolidCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        border: Border.all(),
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
