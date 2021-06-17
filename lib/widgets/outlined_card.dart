part of 'widgets.dart';

class OutlinedCard extends StatelessWidget {
  final String text;
  const OutlinedCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        border: Border.all(
          color: Colors.cyan,
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          color: Colors.cyan,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
