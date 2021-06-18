part of 'widgets.dart';

class OutlinedCard extends StatelessWidget {
  final String text;
  final String postfix;
  const OutlinedCard({
    required this.text,
    required this.postfix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              color: Colors.cyan,
              fontSize: 24.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 24.0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              postfix,
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
