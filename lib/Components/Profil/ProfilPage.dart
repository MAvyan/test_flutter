// ProfilPage.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProfilPage extends StatefulWidget {
  final QueryDocumentSnapshot user;

  ProfilPage({required this.user});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late Duration _duration;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _duration = Duration(days: 2, hours: 12, minutes: 30);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration = _duration - Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String days = twoDigits(duration.inDays);
    String hours = twoDigits(duration.inHours.remainder(24));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${days}j:${hours}h:${minutes}m:${seconds}s";
  }

  String _formatBalance(int balance) {
    final formatter = NumberFormat('#,###');
    return formatter.format(balance);
  }

  @override
  Widget build(BuildContext context) {
    const poppinsTextStyle = TextStyle(fontFamily: 'Poppins');

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF1a1750),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFF7584FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Retour',
                            style: poppinsTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                          'lib/img/premium.png',
                          height: 72,
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Text(
                          _formatDuration(_duration),
                          style: poppinsTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 46.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('lib/img/person.png'),
                                radius: 46,
                                backgroundColor: Color(0xFFdea483),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: CircularProgressIndicator(
                                      value: 0.7,
                                      strokeWidth: 6,
                                      valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF108236)),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF4252B3),
                                    ),
                                    alignment: Alignment.center,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Niv\n',
                                            style: poppinsTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '${widget.user['level']}',
                                            style: poppinsTextStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.user['pseudo'],
                          style: poppinsTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.user['rank_squad'],
                              style: poppinsTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '#${widget.user['global_rank']}',
                              style: poppinsTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _formatBalance(widget.user['balance']),
                              style: poppinsTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SvgPicture.asset(
                                'lib/img/coins.svg',
                                height: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var icon in ['settings.svg', 'trophy.svg', 'sticker.svg', 'share.svg'])
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              // Add actions for each button as needed
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFF4252B3),
                                shape: icon == 'share.svg' ? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: icon == 'share.svg' ? null : BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                'lib/img/$icon',
                                height: icon == 'share.svg' ? 35 : 38,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}