%% load data
clear all; 
clc;
close all;
T = load("CI_Project_data_01.mat");
tData = T.TrainData;
tLabel = T.TrainLabel;
% %% mean of all trials for each channel
% [c, t, d] = size(tData);
% meanOfTrials1 = zeros(c, 1);
% meanOfTrials2 = zeros(c, 1);
% d1 = 0; d2 = 0;
% for i = 1 : d
%     if (tLabel(i) == 1)
%         d1 = d1 + 1;
%     elseif (tLabel(i) == 2)
%         d2 = d2 + 1;
%     end
% end
% for i = 1: c
%    temp1 = zeros(1, 512);
%    temp2 = zeros(1, 512);
%    for j = 1 : d
%        if (tLabel(j) == 1)
%            temp1 = temp1 + tData(i, :, j);
%        elseif (tLabel(j) == 2)
%            temp2 = temp2 + tData(i, :, j);
%        end
%    end
%    meanOfTrials1(i, 1:512) = temp1/d1;
%    meanOfTrials2(i, 1:512) = temp2/d2;
% end
% %% calculate mean
% means1 = zeros(c, 1);
% means2 = zeros(c, 1);
% for i = 1: c
%    temp1 = 0;
%    temp2 = 0;
%    for j = 1 : d
%        if (tLabel(j) == 1)
%            temp1 = temp1 + mean(tData(i, :, j));
%        elseif (tLabel(j) == 2)
%            temp2 = temp2 + mean(tData(i, :, j));
%        end
%    end
%    means1(i, 1) = temp1/d1;
%    means2(i, 1) = temp2/d2;
% end
% figure;
% plot(means1)
% title("mean1 of EEG signal for each channel")
% xlabel("number of channel")
% ylabel("mean of mean of label 1 trials for each channel")
% figure;
% plot(means2)
% title("mean2 of EEG signal for each channel")
% xlabel("number of channel")
% ylabel("mean of mean of label 2 trials for each channel")
% %% calculate variance
% vars1 = zeros(c, 1);
% vars2 = zeros(c, 1);
% for i = 1: c
%    temp1 = 0;
%    temp2 = 0;
%    for j = 1 : d
%        if (tLabel(j) == 1)
%             temp1 = temp1 + var(tData(i, :, j));
%        elseif (tLabel(j) == 2)
%             temp2 = temp2 + var(tData(i, :, j));
%        end
%    end
%    vars1(i, 1) = temp1/d;
%    vars2(i, 1) = temp2/d;
% end
% figure;
% plot(vars1)
% title("VAR of EEG signal for each channel")
% xlabel("number of channel")
% ylabel("mean of variance of label 1 trials for each channel")
% hold on;
% plot(vars2)
% title("VAR of EEG signal for each channel")
% xlabel("number of channel")
% ylabel("mean of variance of label 2 trials for each channel")
% %% covariance matrix
% covars1 = cov(meanOfTrials1');
% covars2 = cov(meanOfTrials2');
% Ro1 = zeros(30);
% for i = 1 : c
%     for j = 1 : c
%         Ro1(i, j) = covars1(i, j) / (sqrt(covars1(i, i))*sqrt(covars1(j, j)));
%     end
% end
% Ro2 = zeros(30);
% for i = 1 : c
%     for j = 1 : c
%         Ro2(i, j) = covars2(i, j) / (sqrt(covars2(i, i))*sqrt(covars2(j, j)));
%     end
% end
% for i = 1 : c
%     for j = i+1 : c
%         if(abs(Ro1(i, j) - Ro2(i, j)) > 0.215)
%             fprintf("i = %d and j = %d", i, j);
%             abs(Ro1(i, j) - Ro2(i, j))
%         end
%     end
% end
% %% PSD
% psds1 = zeros(30, 257);
% psds2 = zeros(30, 257);
% for k = 1 : c
%     temppsds1 = zeros(1, 257);
%     temppsds2 = zeros(1, 257);
%    for i = 1 : d
%             if (tLabel(i) == 1)
%                 temppsds1(1,:) = temppsds1(1,:) + PSD(tData(k, 1:512, i)).';
%             elseif (tLabel(i) == 2)
%                 temppsds2(1,:) = temppsds2(1,:) + PSD(tData(k, 1:512, i)).';
%             end
%    end
%    psds1(k, :) = temppsds1/d1;
%    psds2(k, :) = temppsds2/d2;
% end
% ch_list = {'C4', 'CP4', 'F4', 'FC4', 'Cz','FP2', 'Fz', 'FCz', 'O2', 'TP8', 'P8', ...
%      'FT8', 'T8', 'P4','F8', 'P3', 'CP3', 'C3', 'FC3', 'F3','FP1','Pz',...
%     'CPz','Oz','O1','P7', 'TP7', 'T7', 'FT7', 'F7'};
% plot_topography(ch_list, mean(psds1(:, 1:3),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of delta band of label 1")
% plot_topography(ch_list, mean(psds1(:, 4:7),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of theta band of label 1")
% plot_topography(ch_list, mean(psds1(:, 8:12),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of alpha band of label 1")
% plot_topography(ch_list, mean(psds1(:, 13:16),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of low range beta band of label 1")
% plot_topography(ch_list, mean(psds1(:, 17:20),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of middle range beta band of label 1")
% plot_topography(ch_list, mean(psds1(:, 20:30),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of hight range beta band of label 1")
% plot_topography(ch_list, mean(psds1(:, 31:257),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of gamma band of label 1")
% 
% plot_topography(ch_list, mean(psds2(:, 1:3),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of delta band of label 2")
% plot_topography(ch_list, mean(psds2(:, 4:7),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of theta band of label 2")
% plot_topography(ch_list, mean(psds2(:, 8:12),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of alpha band of label 2")
% plot_topography(ch_list, mean(psds2(:, 13:16),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of low range beta band of label 2")
% plot_topography(ch_list, mean(psds2(:, 17:20),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of middle range beta band of label 2")
% plot_topography(ch_list, mean(psds2(:, 21:30),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of hight range beta band of label 2")
% plot_topography(ch_list, mean(psds2(:, 31:257),2), 0, '10-20', 0, 1, 1000, "Topographical Psd mean of gamma band of label 2")
% 
% [~,I] = max(psds1(:, 1:3),[],2);
% delta = I;
% plot_topography(ch_list, delta, 0, '10-20', 0, 1, 1000, "delta Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 4:7),[],2);
% theta = 3*ones(30,1) + I;
% plot_topography(ch_list, theta, 0, '10-20', 0, 1, 1000, "theta Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 8:12),[],2);
% alpha = 7*ones(30,1) + I;
% plot_topography(ch_list, alpha, 0, '10-20', 0, 1, 1000, "alpha Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 13:16),[],2);
% betaL = 12*ones(30,1) + I;
% plot_topography(ch_list, betaL, 0, '10-20', 0, 1, 1000, "low range beta Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 17:20),[],2);
% betaM = 16*ones(30,1) + I;
% plot_topography(ch_list, betaM, 0, '10-20', 0, 1, 1000, "middle range beta Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 21:30),[],2);
% betaH = 20*ones(30,1) + I;
% plot_topography(ch_list, betaH, 0, '10-20', 0, 1, 1000, "hight range beta Psd peak frequency for label 1")
% [~,I] = max(psds1(:, 31:257),[],2);
% gamma = 30*ones(30,1) + I;
% plot_topography(ch_list, gamma, 0, '10-20', 0, 1, 1000, "gamma Psd peak frequency for label 1")
% [~,I] = max(psds2(:, 1:3),[],2);
% delta = I;
% plot_topography(ch_list, delta, 0, '10-20', 0, 1, 1000, "delta Psd peak frequency for label 2")
% [~,I] = max(psds2(:, 4:7),[],2);
% theta = 3*ones(30,1) + I;
% plot_topography(ch_list, theta, 0, '10-20', 0, 1, 1000, "theta Psd peak frequency for label 2")
% [~,I] = max(psds2(:, 8:12),[],2);
% alpha = 7*ones(30,1) + I;
% plot_topography(ch_list, alpha, 0, '10-20', 0, 1, 1000, "alpha Psd peak frequency for label 2")
% [~,I] = max(psds2(:, 13:16),[],2);
% betaL = 12*ones(30,1) + I;
% plot_topography(ch_list, betaL, 0, '10-20', 0, 1, 1000, "low range beta Psd peak frequency label 2")
% [~,I] = max(psds2(:, 17:20),[],2);
% betaM = 16*ones(30,1) + I;
% plot_topography(ch_list, betaM, 0, '10-20', 0, 1, 1000, "middle range beta Psd peak frequency for label 2")
% [~,I] = max(psds2(:, 21:30),[],2);
% betaH = 20*ones(30,1) + I;
% plot_topography(ch_list, betaH, 0, '10-20', 0, 1, 1000, "hight range beta Psd peak frequency for label 2")
% [~,I] = max(psds2(:, 31:257),[],2);
% gamma = 30*ones(30,1) + I;
% plot_topography(ch_list, gamma, 0, '10-20', 0, 1, 1000, "gamma Psd peak frequency for label 2")
% %% make features vector
% fvector = zeros(d, 1350);
% fisher = zeros(1, 1350);
% for j = 1 : 30
%     for i = 1 : d
%         fvector(i, j) = mean(tData(j, :, i));
%     end
% end
% for j = 31 : 60
%     for i = 1 : d
%         fvector(i, j) = var(tData(j - 30, :, i));
%     end
% end
% for i = 1 : d
%             covarsnew = cov(tData(:, :, i)');
%             for l = 1 : 30
%                 for m = 1: 30
%                     fvector(i, (l - 1)*30 + m + 60) = covarsnew(l, m);
%                 end
%             end
% end
% for i = 1 : d
%     for j = 1 :30
%         psdnew = PSD(tData(j, 1:512, i))';
%         fvector(i, 960+j) = mean(psdnew(:, 1:3),2);
%         fvector(i, 990+j) = mean(psdnew(:, 4:7),2);
%         fvector(i, 1020+j) = mean(psdnew(:, 8:12),2);
%         fvector(i, 1050+j) = mean(psdnew(:, 13:16),2);
%         fvector(i, 1080+j) = mean(psdnew(:, 17:20),2);
%         fvector(i, 1110+j) = mean(psdnew(:, 21:30),2);
%         fvector(i, 1110+j) = mean(psdnew(:, 21:30),2);
%         fvector(i, 1140+j) = mean(psdnew(:, 31:50),2);
%     end
% end
% for i = 1 : d
%     for j = 1 :30
%         psdnew = PSD(tData(j, 1:512, i))';
%         [~,I] = max(psdnew(:, 1:3),[],2);
%         freq = I;
%         fvector(i, 1170+j) = freq;
%         [~,I] = max(psdnew(:, 4:7),[],2);
%         freq = I + 3;
%         fvector(i, 1200+j) = freq;
%         psdnew = PSD(tData(j, 1:512, i))';
%         [~,I] = max(psdnew(:, 8:12),[],2);
%         freq = I + 7;
%         fvector(i, 1230+j) = freq;
%         [~,I] = max(psdnew(:, 13:16),[],2);
%         freq = I + 12;
%         fvector(i, 1260+j) = freq;
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = I + 16;
%         fvector(i, 1290+j) = freq;
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = I + 20;
%         fvector(i, 1290+j) = freq;
%         [~,I] = max(psdnew(:, 31:50),[],2);
%         freq = I + 30;
%         fvector(i, 1320+j) = freq;
%     end
% end
% 
% for i = 1 :1350
% o1 = var(fvector(tLabel == 1, i));
% o2 = var(fvector(tLabel == 2, i));
% o3 = mean(fvector(tLabel == 1, i));
% o4 = mean(fvector(tLabel == 2, i));
% fisher(1, i) = ((o3-o4)^2)/2/(o1+o2);
% end
% [out,idx] = sort(fisher(1:1350));
%%
% fvector = zeros(d, 32);
% for j = 1 : 5
%     for i = 1 : d
%         fvector(i, j) = mean(tData(j, :, i));
%     end
% end
% 
% for j = 26 : 30
%     for i = 1 : d
%         fvector(i, j - 20) = mean(tData(j, :, i));
%     end
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 11) = covarsnew(2, 20)/(covarsnew(2, 2)*covarsnew(20, 20));
% end
% 
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 12) = covarsnew(6, 18)/(covarsnew(6, 6)*covarsnew(18, 18));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 13) = covarsnew(11, 26)/(covarsnew(11, 11)*covarsnew(26, 26));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 14) = covarsnew(11, 30)/(covarsnew(11, 11)*covarsnew(30, 30));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 15) = covarsnew(13, 21)/(covarsnew(13, 13)*covarsnew(21, 21));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 16) = covarsnew(15, 30)/(covarsnew(15, 15)*covarsnew(30, 30));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 17) = covarsnew(16, 30)/(covarsnew(16, 16)*covarsnew(30, 30));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 18) = covarsnew(21, 30)/(covarsnew(21, 21)*covarsnew(30, 30));
% end
% for i = 1 : d
%         covarsnew = cov(tData(:, :, i)');
%         fvector(i, 18) = covarsnew(21, 30)/(covarsnew(21, 21)*covarsnew(30, 30));
% end
% for i = 1 : d
%         psdnew = PSD(tData(29, 1:512, i))';
%         fvector(i, 19) = mean(psdnew(:, 1:3),2);
% end
% for i = 1 : d
%         psdnew = PSD(tData(27, 1:512, i))';
%         fvector(i, 20) = mean(psdnew(:, 1:3),2);
% end
% for i = 1 : d
%         psdnew = PSD(tData(13, 1:512, i))';
%         fvector(i, 21) = mean(psdnew(:, 17:20),2);
% end
% for i = 1 : d
%         psdnew = PSD(tData(15, 1:512, i))';
%         fvector(i, 22) = mean(psdnew(:, 17:20),2);
% end
% for i = 1 : d
%         psdnew = PSD(tData(25, 1:512, i))';
%         fvector(i, 23) = mean(psdnew(:, 21:30),2);
% end
% for i = 1 : d
%         psdnew = PSD(tData(24, 1:512, i))';
%         fvector(i, 24) = mean(psdnew(:, 21:30),2);
% end
% for i = 1 : d
%     psdnew = PSD(tData(15, 1:512, i))';
%     [~,I] = max(psdnew(:, 13:16),[],2);
%     freq = 12 + I;
%         fvector(i, 25) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(21, 1:512, i))';
%         [~,I] = max(psdnew(:, 13:16),[],2);
%         freq = 12 + I;
%         fvector(i, 26) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(8, 1:512, i))';
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = 16 + I;
%         fvector(i, 27) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(4, 1:512, i))';
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = 16 + I;
%         fvector(i, 28) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(8, 1:512, i))';
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = 20 + I;
%         fvector(i, 29) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(24, 1:512, i))';
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = 20 + I;
%         fvector(i, 30) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(22, 1:512, i))';
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = 20 + I;
%         fvector(i, 31) = freq;
% end
% for i = 1 : d
%         psdnew = PSD(tData(4, 1:512, i))';
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = 20 + I;
%         fvector(i, 32) = freq;
% end
% for i = 1 :32
% o1 = var(fvector(tLabel == 1, i));
% o2 = var(fvector(tLabel == 2, i));
% o3 = mean(fvector(tLabel == 1, i));
% o4 = mean(fvector(tLabel == 2, i));
% i
% fisher = ((o3-o4)^2)/2/(o1+o2)
% end
%% create and normalize feature vector
for i=1:110
    NewSig = tData(:,:,i);
    for j = 1 : 30
        [Train_Features(j,i),Train_Features(2*j,i)] = max(abs(NewSig(j,:))) ;
    end
    for j = 1 : 30
        Train_Features(j+60,i) = var(NewSig(j,:)) ;
    end
    for j = 1 : 30
        Train_Features(j+90,i) = mean(NewSig(j,:)) ;
    end
    for j = 1:30
        for k = j + 1:30
            Train_Features((j-1)*30 - j*(j+1)/2+k+120-j,i) = corr(NewSig(j,:)',NewSig(k,:)') ;
        end
    end
%     for j = 1 :30
%         psdnew = PSD(tData(j, 1:512, i))';
%         [~,I] = max(psdnew(:, 1:3),[],2);
%         freq = I;
%         Train_Features(526+j, i) = freq;
%         [~,I] = max(psdnew(:, 4:7),[],2);
%         freq = I + 3;
%         Train_Features(526+j+30, i) = freq;
%         [~,I] = max(psdnew(:, 8:12),[],2);
%         freq = I + 7;
%         Train_Features(526+j+60, i) = freq;
%         [~,I] = max(psdnew(:, 13:16),[],2);
%         freq = I + 12;
%         Train_Features(526+j+90, i) = freq;
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = I + 16;
%         Train_Features(526+j+120, i) = freq;
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = I + 20;
%         Train_Features(526+j+150, i) = freq;
%         [~,I] = max(psdnew(:, 31:50),[],2);
%         freq = I + 30;
%         Train_Features(526+j+180, i) = freq;
%     end
for j = 1:30
psdnew = PSD(tData(j, 1:512, i))';
        Train_Features(526+j, i) = mean(psdnew(:, 1:3),2);
        Train_Features(526+j+30, i) = mean(psdnew(:, 4:7),2);
        Train_Features(526+j+60, i) = mean(psdnew(:, 8:12),2);
        Train_Features(526+j+90, i) = mean(psdnew(:, 13:16),2);
        Train_Features(526+j+120, i) = mean(psdnew(:, 17:20),2);
        Train_Features(526+j+150, i) = mean(psdnew(:, 21:30),2);
        Train_Features(526+j+180, i) = mean(psdnew(:, 31:50),2);
end
end
[Normalized_Train_Features,xPS] = mapminmax(Train_Features) ;
%% select
PVC_indices = find(tLabel==1) ;
Normal_indices = find(tLabel==2) ;

for i=1:525
    u1 = mean(Normalized_Train_Features(i,PVC_indices)) ;
    S1 = (Normalized_Train_Features(i,PVC_indices)-u1)*(Normalized_Train_Features(i,PVC_indices)-u1)' ; % =var(Normalized_Train_Features(i,PVC_indices))
    u2 = mean(Normalized_Train_Features(i,Normal_indices)) ;
    S2 = (Normalized_Train_Features(i,Normal_indices)-u2)*(Normalized_Train_Features(i,Normal_indices)-u2)' ; % =var(Normalized_Train_Features(i,Normal_indices))
    Sw = S1+S2 ;
    
    u0 = mean(Normalized_Train_Features(i,:)) ; 
    Sb = (u1-u0)^2 + (u2-u0)^2 ;
    
    J(i) = Sb/Sw ;
end
[out,idx] = sort(J);


%%
l = [30   195   188   169    90 516    24    25    85    84   506   456    88   507   512   511    31 ...
    33    35    37    39    41    43    45    47    49 51    53    55    57    59]
Train_Label = tLabel - ones(1,110);
for N=5:3:26
    ACC = 0 ;
    % 5-fold cross-validation
    for k=1:5
        train_indices = [1:(k-1)*21,k*21+1:110] ;
        valid_indices = (k-1)*21+1:k*21;
        TrainX = Normalized_Train_Features(l,train_indices) ; % Extracting best features:l
        ValX = Normalized_Train_Features(l,valid_indices) ; % Extracting best features: l
        TrainY = Train_Label(train_indices) ;
        ValY = Train_Label(valid_indices) ;
        net = patternnet(N);
        %net.numLayers = numLayers;
        net = train(net,TrainX,TrainY);
        predict_ys = net(ValX);
        Thr = 0.5 ;
        predict_y = predict_ys >= Thr ;
        ACC = ACC + length(find(predict_y==ValY)) ;
    end

    ACCMat1((N-2)/3) = ACC/110 ;
end
[out,idx] = sort(ACCMat1);
idx
%% test MLP
N = 23;
TrainX = Normalized_Train_Features(l,1:110);
TrainY = Train_Label(1:110) ;
net = patternnet(N);
net = train(net,TrainX,TrainY);
u = T.TestData;
clear Normalized_Train_Features
clear Train_Features
for i=1:50
    NewSig = u(:,:,i);
    for j = 1 : 30
        [Train_Features(j,i),Train_Features(2*j,i)] = max(abs(NewSig(j,:))) ;
    end
    for j = 1 : 30
        Train_Features(j+60,i) = var(NewSig(j,:)) ;
    end
    for j = 1 : 30
        Train_Features(j+90,i) = mean(NewSig(j,:)) ;
    end
    for j = 1:30
        for k = j + 1:30
            Train_Features((j-1)*30 - j*(j+1)/2+k+120-j,i) = corr(NewSig(j,:)',NewSig(k,:)') ;
        end
    end
%     for j = 1 :30
%         psdnew = PSD(tData(j, 1:512, i))';
%         [~,I] = max(psdnew(:, 1:3),[],2);
%         freq = I;
%         Train_Features(526+j, i) = freq;
%         [~,I] = max(psdnew(:, 4:7),[],2);
%         freq = I + 3;
%         Train_Features(526+j+30, i) = freq;
%         [~,I] = max(psdnew(:, 8:12),[],2);
%         freq = I + 7;
%         Train_Features(526+j+60, i) = freq;
%         [~,I] = max(psdnew(:, 13:16),[],2);
%         freq = I + 12;
%         Train_Features(526+j+90, i) = freq;
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = I + 16;
%         Train_Features(526+j+120, i) = freq;
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = I + 20;
%         Train_Features(526+j+150, i) = freq;
%         [~,I] = max(psdnew(:, 31:50),[],2);
%         freq = I + 30;
%         Train_Features(526+j+180, i) = freq;
%     end
for j = 1:30
psdnew = PSD(tData(j, 1:512, i))';
        Train_Features(526+j, i) = mean(psdnew(:, 1:3),2);
        Train_Features(526+j+30, i) = mean(psdnew(:, 4:7),2);
        Train_Features(526+j+60, i) = mean(psdnew(:, 8:12),2);
        Train_Features(526+j+90, i) = mean(psdnew(:, 13:16),2);
        Train_Features(526+j+120, i) = mean(psdnew(:, 17:20),2);
        Train_Features(526+j+150, i) = mean(psdnew(:, 21:30),2);
        Train_Features(526+j+180, i) = mean(psdnew(:, 31:50),2);
end
end
[Normalized_Train_Features,xPS] = mapminmax(Train_Features) ;

ValX = Normalized_Train_Features(l,:) ;
predict_ys = net(ValX);
Thr = 0.5 ;
predict_y = predict_ys >= Thr;
predict_y = predict_y + ones();

 %save('MLP1.mat','predict_y');
%% RBF
Train_Label = tLabel - ones(1,110);
spreadMat = 0.5:0.5:7 ;
NMat = 5:5:45 ;
for s = 1:14
    spread = spreadMat(s) ;
    for n = 1:9
        Maxnumber = NMat(n) ;
        ACC = 0 ;
        % 5-fold cross-validation
        for k=1:5
            train_indices = [1:(k-1)*21,k*21+1:110] ;
            valid_indices = (k-1)*21+1:k*21 ;
            TrainX = Normalized_Train_Features(l,train_indices) ;
            ValX = Normalized_Train_Features(l,valid_indices) ;
            TrainY = Train_Label(train_indices) ;
            ValY = Train_Label(valid_indices) ;
            net = newrb(TrainX,TrainY,10^-5,spread,Maxnumber) ;
            predict_y = net(ValX);
            Thr = 0.5 ;
            predict_y = predict_y >= Thr ;
            ACC = ACC + length(find(predict_y==ValY)) ;
        end
        ACCMat2(s,n) = ACC/110 ;
    end
end
 [R,C] = ndgrid(1:size(ACCMat2,1),1:size(ACCMat2,2));
 [b,idx] = sort(ACCMat2(:));
 [R(idx),C(idx)]
 %% test RBF
 Train_Label = tLabel - ones(1,110);
 TrainX = Normalized_Train_Features(l,:) ;
TrainY = Train_Label(:);

net1 = newrb(TrainX,TrainY',10^(-5),3.5,20) ;
u = T.TestData;
clear Normalized_Train_Features
clear Train_Features
for i=1:50
    NewSig = u(:,:,i);
    for j = 1 : 30
        [Train_Features(j,i),Train_Features(2*j,i)] = max(abs(NewSig(j,:))) ;
    end
    for j = 1 : 30
        Train_Features(j+60,i) = var(NewSig(j,:)) ;
    end
    for j = 1 : 30
        Train_Features(j+90,i) = mean(NewSig(j,:)) ;
    end
    for j = 1:30
        for k = j + 1:30
            Train_Features((j-1)*30 - j*(j+1)/2+k+120-j,i) = corr(NewSig(j,:)',NewSig(k,:)') ;
        end
    end
%     for j = 1 :30
%         psdnew = PSD(tData(j, 1:512, i))';
%         [~,I] = max(psdnew(:, 1:3),[],2);
%         freq = I;
%         Train_Features(526+j, i) = freq;
%         [~,I] = max(psdnew(:, 4:7),[],2);
%         freq = I + 3;
%         Train_Features(526+j+30, i) = freq;
%         [~,I] = max(psdnew(:, 8:12),[],2);
%         freq = I + 7;
%         Train_Features(526+j+60, i) = freq;
%         [~,I] = max(psdnew(:, 13:16),[],2);
%         freq = I + 12;
%         Train_Features(526+j+90, i) = freq;
%         [~,I] = max(psdnew(:, 17:20),[],2);
%         freq = I + 16;
%         Train_Features(526+j+120, i) = freq;
%         [~,I] = max(psdnew(:, 21:30),[],2);
%         freq = I + 20;
%         Train_Features(526+j+150, i) = freq;
%         [~,I] = max(psdnew(:, 31:50),[],2);
%         freq = I + 30;
%         Train_Features(526+j+180, i) = freq;
%     end
for j = 1:30
psdnew = PSD(tData(j, 1:512, i))';
        Train_Features(526+j, i) = mean(psdnew(:, 1:3),2);
        Train_Features(526+j+30, i) = mean(psdnew(:, 4:7),2);
        Train_Features(526+j+60, i) = mean(psdnew(:, 8:12),2);
        Train_Features(526+j+90, i) = mean(psdnew(:, 13:16),2);
        Train_Features(526+j+120, i) = mean(psdnew(:, 17:20),2);
        Train_Features(526+j+150, i) = mean(psdnew(:, 21:30),2);
        Train_Features(526+j+180, i) = mean(psdnew(:, 31:50),2);
end
end
[Normalized_Train_Features,xPS] = mapminmax(Train_Features) ;

ValX = Normalized_Train_Features(l,:) ;
predict_y = net1(ValX);
Thr = 0.5 ;
predict_y = predict_y >= Thr ;
predict_y = predict_y + ones();


%% functions
function psd = PSD(x)
fs = 256;
t = 0:1/fs:1-1/fs;
N = length(x);
psd = periodogram(x,rectwin(N),N,fs);
end

function h = plot_topography(ch_list, values, make_contour, system, plot_channels, plot_clabels, INTERP_POINTS, name)
figure;
    % Error detection
    if nargin < 2, error('[plot_topography] Not enough parameters.');
    else
        if ~iscell(ch_list) && ~ischar(ch_list)
            error('[plot_topography] ch_list must be "all" or a cell array.');
        end
        if ~isnumeric(values)
            error('[plot_topography] values must be a numeric vector.');
        end
    end
    if nargin < 3, make_contour = false;
    else
        if make_contour~=1 && make_contour~=0
            error('[plot_topography] make_contour must be a boolean (true or false).');
        end
    end
    if nargin < 4, system = '10-20';
    else
        if ~ischar(system) && ~istable(system)
            error('[plot_topography] system must be a string or a table.');
        end
    end
    if nargin < 5, plot_channels = true;
    else
        if plot_channels~=1 && plot_channels~=0
            error('[plot_topography] plot_channels must be a boolean (true or false).');
        end
    end
    if nargin < 5, plot_clabels = false;
    else
        if plot_clabels~=1 && plot_clabels~=0
            error('[plot_topography] plot_clabels must be a boolean (true or false).');
        end
    end
    if nargin < 6, INTERP_POINTS = 1000;
    else
        if ~isnumeric(INTERP_POINTS)
            error('[plot_topography] N must be an integer.');
        else
            if mod(INTERP_POINTS,1) ~= 0
                error('[plot_topography] N must be an integer.');
            end
        end
    end
    
    % Loading electrode locations
    if ischar(system)
        switch system
            case '10-20'
                % 10-20 system
                load('Standard_10-20_81ch.mat', 'locations');
            case '10-10'
                % 10-10 system
                load('Standard_10-10_47ch.mat', 'locations');
            case 'yokogawa'
                % Yokogawa MEG system
                load('MEG_Yokogawa-440ag.mat', 'locations');
            otherwise
                % Custom path
                load(system, 'locations');
        end
    else
        % Custom table
        locations = system;
    end
    
    % Finding the desired electrodes
    ch_list = upper(ch_list);
    if ~iscell(ch_list)
        if strcmp(ch_list,'all')
            idx = 1:length(locations.labels);
            if length(values) ~= length(idx)
                error('[plot_topography] There must be a value for each of the %i channels.', length(idx));
            end
        else, error('[plot_topography] ch_list must be "all" or a cell array.');
        end
    else
        if length(values) ~= length(ch_list)
            error('[plot_topography] values must have the same length as ch_list.');
        end
        idx = NaN(length(ch_list),1);
        for ch = 1:length(ch_list)
            if isempty(find(strcmp(locations.labels,ch_list{ch})))
                warning('[plot_topography] Cannot find the %s electrode.',ch_list{ch});
                ch_list{ch} = [];
                values(ch)  = [];
                idx(ch)     = [];
            else
                idx(ch) = find(strcmp(locations.labels,ch_list{ch}));
            end
        end
    end
    values = values(:);
    
    % Global parameters
    %   Note: Head radius should be set as 0.6388 if the 10-20 system is used.
    %   This number was calculated taking into account that the distance from Fpz
    %   to Oz is d=2*0.511. Thus, if the circle head must cross the nasion and
    %   the inion, it should be set at 5d/8 = 0.6388.
    %   Note2: When the number of interpolation points rises, the plots become
    %   smoother and more accurate, however, computational time also rises.
    HEAD_RADIUS     = 5*2*0.511/8;  % 1/2  of the nasion-inion distance
    HEAD_EXTRA      = 1*2*0.511/8;  % 1/10 of the nasion-inion distance
    k = 4;                          % Number of nearest neighbors for interpolation
    
    % Interpolating input data
        % Creating the rectangle grid (-1,1)
        [ch_x, ch_y] = pol2cart((pi/180).*((-1).*locations.theta(idx)+90), ...
                                locations.radius(idx));     % X, Y channel coords
        % Points out of the head to reach more natural interpolation
        r_ext_points = 1.2;
        [add_x, add_y] = pol2cart(0:pi/4:7*pi/4,r_ext_points*ones(1,8));
        linear_grid = linspace(-r_ext_points,r_ext_points,INTERP_POINTS);         % Linear grid (-1,1)
        [interp_x, interp_y] = meshgrid(linear_grid, linear_grid);
        
        % Interpolate and create the mask
        outer_rho = max(locations.radius(idx));
        if outer_rho > HEAD_RADIUS, mask_radius = outer_rho + HEAD_EXTRA;
        else,                       mask_radius = HEAD_RADIUS;
        end
        mask = (sqrt(interp_x.^2 + interp_y.^2) <= mask_radius); 
        add_values = compute_nearest_values([add_x(:), add_y(:)], [ch_x(:), ch_y(:)], values(:), k);
        interp_z = griddata([ch_x(:); add_x(:)], [ch_y(:); add_y(:)], [values; add_values(:)], interp_x, interp_y, 'natural');
        interp_z(mask == 0) = NaN;
        % Plotting the final interpolation
        pcolor(interp_x, interp_y, interp_z);
        shading interp;
        hold on;
        
        % Contour
        if make_contour
            [~, hfigc] = contour(interp_x, interp_y, interp_z); 
            set(hfigc, 'LineWidth',0.75, 'Color', [0.2 0.2 0.2]); 
            hold on;
        end
    % Plotting the head limits as a circle         
    head_rho    = HEAD_RADIUS;                      % Head radius
    if strcmp(system,'yokogawa'), head_rho = 0.45; end
    head_theta  = linspace(0,2*pi,INTERP_POINTS);   % From 0 to 360Âº
    head_x      = head_rho.*cos(head_theta);        % Cartesian X of the head
    head_y      = head_rho.*sin(head_theta);        % Cartesian Y of the head
    plot(head_x, head_y, 'Color', 'k', 'LineWidth',4);
    hold on;
    % Plotting the nose
    nt = 0.15;      % Half-nose width (in percentage of pi/2)
    nr = 0.22;      % Nose length (in radius units)
    nose_rho   = [head_rho, head_rho+head_rho*nr, head_rho];
    nose_theta = [(pi/2)+(nt*pi/2), pi/2, (pi/2)-(nt*pi/2)];
    nose_x     = nose_rho.*cos(nose_theta);
    nose_y     = nose_rho.*sin(nose_theta);
    plot(nose_x, nose_y, 'Color', 'k', 'LineWidth',4);
    hold on;
    % Plotting the ears as ellipses
    ellipse_a = 0.08;                               % Horizontal exentricity
    ellipse_b = 0.16;                               % Vertical exentricity
    ear_angle = 0.9*pi/8;                           % Mask angle
    offset    = 0.05*HEAD_RADIUS;                   % Ear offset
    ear_rho   = @(ear_theta) 1./(sqrt(((cos(ear_theta).^2)./(ellipse_a^2)) ...
        +((sin(ear_theta).^2)./(ellipse_b^2))));    % Ellipse formula in polar coords
    ear_theta_right = linspace(-pi/2-ear_angle,pi/2+ear_angle,INTERP_POINTS);
    ear_theta_left  = linspace(pi/2-ear_angle,3*pi/2+ear_angle,INTERP_POINTS);
    ear_x_right = ear_rho(ear_theta_right).*cos(ear_theta_right);          
    ear_y_right = ear_rho(ear_theta_right).*sin(ear_theta_right); 
    ear_x_left  = ear_rho(ear_theta_left).*cos(ear_theta_left);         
    ear_y_left  = ear_rho(ear_theta_left).*sin(ear_theta_left); 
    plot(ear_x_right+head_rho+offset, ear_y_right, 'Color', 'k', 'LineWidth',4); hold on;
    plot(ear_x_left-head_rho-offset, ear_y_left, 'Color', 'k', 'LineWidth',4); hold on;
    % Plotting the electrodes
    % [ch_x, ch_y] = pol2cart((pi/180).*(locations.theta(idx)+90), locations.radius(idx));
    if plot_channels, he = scatter(ch_x, ch_y, 60,'k', 'LineWidth',1.5); end
    if plot_clabels, text(ch_x, ch_y, ch_list); end
    if strcmp(system,'yokogawa'), delete(he); plot(ch_x, ch_y, '.k'); end
    
    % Last considerations
    max_height = max([max(nose_y), mask_radius]);
    min_height = -mask_radius;
    max_width  = max([max(ear_x_right+head_rho+offset), mask_radius]);
    min_width  = -max_width;
    L = max([min_height, max_height, min_width, max_width]);
    xlim([-L, L]);
    ylim([-L, L]);  
    colorbar;   % Feel free to modify caxis after calling the function
    title(name)
    axis square;
    axis off;
    hold off;
    h = gcf;
end
% This function compute the mean values of the k-nearest neighbors
%   - coor_add:     XY coordinates of the virtual electrodes
%   - coor_neigh:   XY coordinates of the real electrodes
%   - val_neigh:    Values of the real electrodes
%   - k:            Number of neighbors to consider
function add_val = compute_nearest_values(coor_add, coor_neigh, val_neigh, k)
    
    add_val = NaN(size(coor_add,1),1);
    L = length(add_val);
    
    for i = 1:L
        % Distances between the added electrode and the original ones
        target = repmat(coor_add(i,:),size(coor_neigh,1),1);
        d = sqrt(sum((target-coor_neigh).^2,2));
        
        % K-nearest neighbors
        [~, idx] = sort(d,'ascend');
        idx = idx(2:1+k);
        
        % Final value as the mean value of the k-nearest neighbors
        add_val(i) = mean(val_neigh(idx));
    end
    
end






