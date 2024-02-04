void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw() {
  background(0);

  // 塗りつぶしの色が白
  fill(255);

  // 二つの白い円の中心の距離
  // float = 小数点を含む数値を扱うためのデータ型
  float distanceBetweenCircles = 280;
  float centerX1 = width/2 - distanceBetweenCircles/2;
  float centerY1 = height/2;
  float centerX2 = width/2 + distanceBetweenCircles/2;
  float centerY2 = height/2;

  // 白い円の半径
  float radius = 200;
  // ellipse = 円を描く
  ellipse(centerX1, centerY1, radius, radius);
  ellipse(centerX2, centerY2, radius, radius);

  // 塗りつぶしの色が黒
  fill(0);

  // 左側の黒い円の座標（マウスのカーソルの座標から二つの白い円の中心の距離分ずらしている）
  float targetX1 = mouseX - distanceBetweenCircles/2;
  float targetY1 = mouseY;

  // 右側の黒い円の座標（マウスのカーソルの座標から二つの白い円の中心の距離分ずらしている）
  float targetX2 = mouseX + distanceBetweenCircles/2;
  float targetY2 = mouseY;

  // 黒い円の半径
  float blackRadius = 50;

  // 左側1、右側2の白い円の中心から見たマウスカーソルの位置に対する角度
  float angle1, angle2;

  // 左側の黒い円が白い円の中に入っているかどうかをチェック
  // dist = 二点間の直線距離を計算する関数
  if (dist(targetX1, targetY1, centerX1, centerY1) > radius/2 - blackRadius/2) {

  // 黒い円を白い円の中にとどめる
  // atan2 = 原点から見た点の角度を計算するための関数
    angle1 = atan2(targetY1 - centerY1, targetX1 - centerX1);
    targetX1 = centerX1 + cos(angle1) * (radius/2 - blackRadius/2);
    targetY1 = centerY1 + sin(angle1) * (radius/2 - blackRadius/2);
  }
  
  // マウスカーソルに対する角度を計算する
  angle1 = atan2(mouseY - centerY1, mouseX - centerX1);
  
  // マウスカーソルに向かって黒い円を描く
  // pushMatrix = 現在の座標変換の状態を保存する
  pushMatrix();
  // translate = 座標を全部そのまま移動する
  translate(targetX1, targetY1);
  // rotate = 座標を回転させる
  rotate(angle1);
  // 実際にマウスのカーソルついて動いた左側の黒い円の中心を（0,0）に更新している
  ellipse(0, 0, blackRadius, blackRadius);
  // popMatrix = 保存された座標変換の状態を復元する
  popMatrix();
  
  // 右側の黒い円が白い円の中に入っているかどうかをチェック
  if (dist(targetX2, targetY2, centerX2, centerY2) > radius/2 - blackRadius/2) {
    angle2 = atan2(targetY2 - centerY2, targetX2 - centerX2);
    targetX2 = centerX2 + cos(angle2) * (radius/2 - blackRadius/2);
    targetY2 = centerY2 + sin(angle2) * (radius/2 - blackRadius/2);
  }
  
  angle2 = atan2(mouseY - centerY2, mouseX - centerX2);
  
  pushMatrix();
  translate(targetX2, targetY2);
  rotate(angle2);
  ellipse(0, 0, blackRadius, blackRadius);
  popMatrix();
}
