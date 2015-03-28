d = [ 1.78,  3, 4.2, 9.9, 12.1, 9.9, 4.2, 3.6, 2.5 ];
l = [ 3.35, 1.15, 0.7, 1, 5, 1, 0.5, 1.2, 5.2];
support_w = 0.8;

function sumv(v,i,s=0) = (i < 0 ? 0 : i==s ? v[i] : v[i] + sumv(v,i-1,s));

translate ([0,0,max(d)/2]) rotate ([-90,0,0])
for (i = [0: 8])
{
    echo(i = i, r = d[i]/2, h = l[i]);
    length = sumv( l, i - 1 );
    echo (len = length);
    translate([0,0,length]) cylinder( r1 = d[i]/2, r2 = d[i]/2, h = l[i], $fn=100);
}

translate([-support_w/2,0,0]) cube([support_w, sumv( l, 8 ), max(d)/2]);