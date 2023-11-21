import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/web_view_app.dart';

class NewsTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  /*  const NewsTile({
    super.key,
   required this.newsitem,
  }); */
  // ignore: non_constant_identifier_name

  const NewsTile({super.key, required this.newsitem});
  final NewsModel newsitem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return    WebView(news: newsitem.url, );
          }));
        },
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWHPDdio4TueahGDlMfFgnyeiK6WCiQ1YW8A&usqp=CAU',
                    newsitem.image ??
                        'https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1024-512,f_auto,q_auto:best/newscms/2019_01/2705191/nbc-social-default.png',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  )),

              Text(
                //'Salah returned to the Premier League in July 2017 after signing to play for Liverpool. He netted an astonishing 32 goals in Premier League matches in 2017–18, setting a Premier League record for the most goals scored by a player during a single 38-game season.',
                //newsitem.text,
                newsitem.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Text(
                //'He proved to be his international teams trump card en route to victory in the 2006 Africa Cup of Nations in February',
                newsitem.subtext ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
