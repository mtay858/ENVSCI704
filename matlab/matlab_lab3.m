

Below is the code used in Metlab. 

%clear all the data in the Workspace and Command Window
%load in data


data1=load("Karamu_floodgates.txt"); %first column is time, second is data
data2=load('Tutae_GoodsBridge.txt');
data3=load('Ngaruroro_Fernhill.txt');
data4=load('Tutaekuri.txt');


time1= datenum(2015,1,15,13,0,0); %creates a metlab time variable Time1

%data1(:,1) = data1(:,1) - data1(1,1) + time1; %convert excel time to matlab time

%riverDischarge1=data1(:,2);

%figure(1)
%plot(data1(:,1),riverDischarge1, 'r') %plot time, variable and color it red
%title('Kaeamu Floodgates Timeseries') %plot(x,y,options)
%ylabel('River Discharge Units') %'r' = red, 'b'=blue, 'k'=black
%xlabel('Year') %
%datetick('x','yyyy') %



tst = max([data1(1,1), data2(1,1), data3(1,1), data4(1,1)]); %this pulls the missing data to the next data point
tnd = min ([data1(end,1), data2(end,1), data3(end,1), data4(end,1)]); %this pulls the min end point and does something me thinks? 

t = tst:1/24:tnd; %time series t starts at tst, steps by 1/24, ends at tnd

for j=2:length(t) 
    jj = find(data1(:,1) > t(j-1) & data1(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d1_int(j-1) = mean (data1(jj,2)); %interpolate values
    else % if YES
        d1_int(j-1) = NaN;
    end
end 

missingValues = sum(isnan(d1_int)); 

%repeating for data set 2 : Tutae Foods Bridge
%copy and paste but then change data1 to data2
for j=2:length(t) 
    jj = find(data2(:,1) > t(j-1) & data2(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d2_int(j-1) = mean (data2(jj,2)); %interpolate values
    else % if YES
        d2_int(j-1) = NaN; 
    end
end 

%regression function
j1 = ~isnan(d1_int); % ~ is the logical operator NOT, so 
% this line is saying, if NOT NaN
j2 = ~isnan(d2_int);
j = j1 & j2; %logical array where elements are true if j1&j2 are not NaN

Y = d2_int(j).';                % make Y a column vector
X = [d1_int(j).', ones(sum(j),1)];  % make X an n-by-2 matrix (column d1 and intercept)
[B,BINT,R,RINT,STATS] = regress(Y,X);
D2_MODEL = B(1).*d1_int+B(2);

figure()
hold on
plot(t(1:end-1),D2_MODEL, 'r')
plot(t(1:end-1),d2_int, 'k')

hold off %this is the END of combining data 1 with data 2 to complete the missing data

%This is the beginning of combining data 3 with data 2. to complete and find the missing data
%clear all the data in the Workspace and Command Window
%load in data
%To my understanding I have to copy evverything but switch out the data. I
%hope

time3= datenum(2015,1,15,13,0,0); %creates a metlab time variable Time3 

%data3(:,1) = data3(:,1) - data3(1,1) + time3; %convert excel time to matlab time
%riverDischarge1=data1(:,2);
%figure(3)
%plot(data3(:,1),riverDischarge1, 'r') %plot time, variable and color it red
%title('KNgaruroro Timeseries') %plot(x,y,options)
%ylabel('River Discharge Units') %'r' = red, 'b'=blue, 'k'=black
%xlabel('Year') %
%datetick('x','yyyy') %



tst = max([data1(1,1), data2(1,1), data3(1,1), data4(1,1)]); %this pulls the missing data to the next data point
tnd = min ([data1(end,1), data2(end,1), data3(end,1), data4(end,1)]); %this pulls the min end point and does something me thinks? 

t = tst:1/24:tnd; %time series t starts at tst, steps by 1/24, ends at tnd

for j=2:length(t) 
    jj = find(data3(:,1) > t(j-1) & data3(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d3_int(j-1) = mean (data3(jj,2)); %interpolate values
    else % if YES
        d3_int(j-1) = NaN;
    end
end 

missingValues = sum(isnan(d3_int)); 

%repeating for data set 2 : Ngaruroro Fernhill
%copy and paste but then change data3 to data2
for j=2:length(t) 
    jj = find(data2(:,1) > t(j-1) & data2(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d2_int(j-1) = mean (data2(jj,2)); %interpolate values
    else % if YES
        d2_int(j-1) = NaN; 
    end
end 

%regression function
j3 = ~isnan(d3_int); % ~ is the logical operator NOT, so 
% this line is saying, if NOT NaN
j2 = ~isnan(d2_int);
j = j3 & j2; %logical array where elements are true if j1&j2 are not NaN

Y = d2_int(j).';                % make Y a column vector
X = [d3_int(j).', ones(sum(j),1)];  % make X an n-by-2 matrix (column d1 and intercept)
[B,BINT,R,RINT,STATS] = regress(Y,X);
D2_MODEL = B(1).*d3_int+B(2);

figure()
hold on
plot(t(1:end-1),D2_MODEL, 'r')
plot(t(1:end-1),d2_int, 'k')

hold off


%clear all the data in the Workspace and Command Window
%load in data
%okay now do the same for data4 into a conversion/fill in for the missing data in data2


time4= datenum(2015,1,15,13,0,0); %creates a metlab time variable Time1

%data1(:,1) = data1(:,1) - data1(1,1) + time1; %convert excel time to matlab time

%riverDischarge1=data1(:,2);

%figure(4)
%plot(data1(:,1),riverDischarge1, 'r') %plot time, variable and color it red
%title('Tutaekuri Timeseries') %plot(x,y,options)
%ylabel('River Discharge Units') %'r' = red, 'b'=blue, 'k'=black
%xlabel('Year') %
%datetick('x','yyyy') %



tst = max([data1(1,1), data2(1,1), data3(1,1), data4(1,1)]); %this pulls the missing data to the next data point
tnd = min ([data1(end,1), data2(end,1), data3(end,1), data4(end,1)]); %this pulls the min end point and does something me thinks? 

t = tst:1/24:tnd; %time series t starts at tst, steps by 1/24, ends at tnd

for j=2:length(t) 
    jj = find(data4(:,1) > t(j-1) & data4(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d4_int(j-1) = mean (data4(jj,2)); %interpolate values
    else % if YES
        d4_int(j-1) = NaN;
    end
end 

missingValues = sum(isnan(d4_int)); 

%repeating for data set 2 : Tutae Foods Bridge
%copy and paste but then change data4 to data2
for j=2:length(t) 
    jj = find(data2(:,1) > t(j-1) & data2(:,1) <= t(j)); %logical array of 0 and 1, finding data
    if isempty(jj) == 0 %if NOT empty (0 is false)
        d2_int(j-1) = mean (data2(jj,2)); %interpolate values
    else % if YES
        d2_int(j-1) = NaN; 
    end
end 

%regression function
j4 = ~isnan(d4_int); % ~ is the logical operator NOT, so 
% this line is saying, if NOT NaN
j2 = ~isnan(d2_int);
j = j4 & j2; %logical array where elements are true if j1&j2 are not NaN

Y = d2_int(j).';                % make Y a column vector
X = [d4_int(j).', ones(sum(j),1)];  % make X an n-by-2 matrix (column d1 and intercept)
[B,BINT,R,RINT,STATS] = regress(Y,X);
D2_MODEL = B(1).*d4_int+B(2);

figure()
hold on
plot(t(1:end-1),D2_MODEL, 'r')
plot(t(1:end-1),d2_int, 'k')

hold off