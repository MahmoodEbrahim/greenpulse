import 'package:flutter/material.dart';

class SignScreen extends StatelessWidget {
  static const String routeName = "signScreen";

  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // يحط العناصر على اليسار
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1), // مسافة من الأعلى عشان تبعد الصورة شوية
            Center(
              child: Image.asset(
                "aseets/images/15ab32a3-cbd5-4eb0-bd9a-c6498a7d826f-removebg-preview.png",
                width: screenWidth * 0.6, // حجم الصورة يكون 60% من عرض الشاشة
                height: screenHeight * 0.16, // حجم الصورة يكون 30% من ارتفاع الشاشة
                fit: BoxFit.contain, // يخلي الصورة متناسقة بدون قص
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08), // بادنج من اليمين واليسار
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Name",
                      style: Theme.of(context).textTheme.headlineMedium
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    style:Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500
                      ),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).focusColor,
        
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                      "Email",
                      style: Theme.of(context).textTheme.headlineMedium
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    style:Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500
                      ),
                      prefixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).focusColor,
        
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(
                      "Password",
                      style: Theme.of(context).textTheme.headlineMedium
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    style:Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500
                      ),
                      prefixIcon: Icon(Icons.lock_clock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).focusColor,
        
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                      "re-Password",
                      style: Theme.of(context).textTheme.headlineMedium
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    style:Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      labelText: "re-Password",
                      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).focusColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).focusColor,
        
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // 80% من عرض الشاشة
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text("Create account",style: TextStyle(
                    color: Theme.of(context).shadowColor
                ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 19),
                  backgroundColor: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          width: 2
        
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
