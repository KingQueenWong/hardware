% simulate one cycle

IPeak = 30;
Vbus = 100;
VqSet = 30;


t = 0:0.001:1;
w = 2 * pi;
theta = 45*pi/180;

Ia = cos(w*t) * IPeak;
Ib = cos(w*t-2*pi/3) * IPeak;
Ic = cos(w*t-4*pi/3) * IPeak;


subplot(331);
plot(t,Ia,t,Ib,t,Ic);
legend('Ia','Ib','Ic');

Ialpha = Ia;
Ibeta = Ia/sqrt(3) + 2*Ib/sqrt(3);

subplot(334);
plot(t,Ialpha,t,Ibeta);
legend('I\alpha','I\beta');

sinTheta = sin(w*t-pi/2);
cosTheta = cos(w*t-pi/2);

Id =  Ialpha .* cosTheta + Ibeta .* sinTheta;
Iq = -Ialpha .* sinTheta + Ibeta .* cosTheta;

subplot(337);
plot(t,Id,t,Iq);
legend('Id','Iq');

Vd = 0*ones(1,length(t));
Vq = VqSet*ones(1,length(t));

subplot(338);
plot(t,Vd,t,Vq);
legend('Vd','Vq');

Valpha = Vd .* cosTheta - Vq .* sinTheta;
Vbeta =  Vd .* sinTheta + Vq .* cosTheta;

subplot(335);
plot(t,Valpha,t,Vbeta);
legend('V\alpha','V\beta');

Va = Valpha;
Vb = -Valpha * 0.5 + sqrt(3.0)/2.0 * Vbeta;
Vc = -Valpha * 0.5 - sqrt(3.0)/2.0 * Vbeta;

subplot(332);
plot(t,Va,t,Vb,t,Vc);
legend('Va','Vb','Vc');

Va = Va*0.5;
Vb = Vb*0.5;
Vc = Vc*0.5;

Vk = (( max([Va; Vb; Vc])' + min([Va; Vb; Vc])' ) * 0.5);

V1 = (Va - Vk')/Vbus+0.5;
V2 = (Vb - Vk')/Vbus+0.5;
V3 = (Vc - Vk')/Vbus+0.5;
Vk = Vk + 0.5; 
subplot(333);
plot(t,V1,t,V2,t,V3);
legend('V1','V2','V3')


