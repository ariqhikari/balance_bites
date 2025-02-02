part of 'shared.dart';

// Margin
const double defaultMargin = 16;

// Padding
const double defaultPadding = 20;

// Duration
const Duration animationDuration = Duration(milliseconds: 250);

// Shadow
BoxShadow defaultBoxShadow = BoxShadow(
  blurRadius: 12,
  offset: const Offset(0, 1),
  color: '477639'.toColor().withOpacity(.05),
);

// Colors
Color blueColor = '097BFD'.toColor();
Color yellowColor = 'FFBC57'.toColor();
Color redColor = 'FF5757'.toColor();

Color greenColor = '80C978'.toColor();
Color darkGreenColor = '47673B'.toColor();

Color successColor = '1A9D8C'.toColor();

Color blackColor = '212121'.toColor();

Color grayColor = 'F4F2F3'.toColor();
Color lightGrayColor = 'FAFAFA'.toColor();
Color darkGrayColor = '9E9E9E'.toColor();

Color whiteColor = 'FFFFFF'.toColor();

// Poppins Fonts
TextStyle regularPoppinsFontStyle = GoogleFonts.poppins(
  color: darkGrayColor,
  fontSize: 14,
);

TextStyle mediumPoppinsFontStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldPoppinsFontStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle boldPoppinsFontStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

TextStyle extraBoldPoppinsFontStyle = GoogleFonts.poppins(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w800,
);

// Heading
TextStyle headingPrimaryFontStyle =
    extraBoldPoppinsFontStyle.copyWith(fontSize: 30);

TextStyle headingSecondaryFontStyle =
    semiBoldPoppinsFontStyle.copyWith(fontSize: 18);

// Inputs
InputDecoration defaultInputStyle = makeInput(12);
InputDecoration whiteInputStyle = makeInput(12, isWhite: true);

InputDecoration makeInput(double borderRadius, {bool isWhite = false}) {
  return InputDecoration(
    filled: true,
    fillColor: isWhite ? whiteColor.withOpacity(.12) : lightGrayColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
    hintStyle: regularPoppinsFontStyle.copyWith(
        color: isWhite ? whiteColor.withOpacity(.5) : darkGrayColor,
        fontSize: 16),
    errorStyle: regularPoppinsFontStyle.copyWith(color: redColor, fontSize: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: isWhite ? whiteColor : 'E0E0E0'.toColor(),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: isWhite ? whiteColor : 'E0E0E0'.toColor(),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: isWhite ? whiteColor : yellowColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: redColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: 1,
        color: isWhite ? whiteColor : yellowColor,
      ),
    ),
  );
}

// Buttons
ButtonStyle defaultButtonStyle = makeButton(greenColor);

// Functions
ButtonStyle makeButton(
  Color primary, {
  double borderRadius = 12,
  Color textColor = Colors.white,
}) {
  return ElevatedButton.styleFrom(
    foregroundColor: textColor,
    backgroundColor: primary,
    disabledForegroundColor: primary.withOpacity(0.38),
    disabledBackgroundColor: primary.withOpacity(0.12),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)),
    elevation: 0,
    shadowColor: Colors.transparent,
  );
}

// Loading Indicator
Widget makeLoadingIndicator({Color color = const Color(0XFFF4AE00)}) {
  return SpinKitRing(
    size: 40,
    color: color,
  );
}

// Snackbar
void showSnackBar(String message, {String status = "Gagal"}) {
  Get.snackbar(
    status,
    message,
    colorText: whiteColor,
    backgroundColor: status == "Gagal" ? redColor : greenColor,
    icon: Icon(Icons.add_alert, color: whiteColor),
  );
}
