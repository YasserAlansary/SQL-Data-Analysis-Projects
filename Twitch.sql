--Most pupular channels
select Top 20 channel, watch_time
from Twitch..twitchdata

--Unpupular channels
select channel, watch_time,stream_time
from Twitch..twitchdata
where channel not in (
	select channel
	from Twitch..twitchdata
	where channel is not null and stream_time > watch_time) 
order by watch_time asc;

--Most popular channels that do not speak English
select channel, watch_time, language
from Twitch..twitchdata
where channel is not null and language != 'English';

--Streaming time in minutes.
select Top 20 channel, stream_time , watch_time
from Twitch..twitchdata
where channel is not null
order by stream_time desc;
 
--Some important averages and times are measured in minutes
select avg(watch_time) as average_views, avg(stream_time) as average_streaming_time,
avg(followers) as average_folowers, avg()
from Twitch..twitchdata;

--The top ten channels in terms of peak viewership
select top 10 channel, peak_viewers 
from Twitch..twitchdata
where channel is not null
order by peak_viewers desc;

--How profitable are followers?
select channel,followers, followers_gained, ROUND((followers_gained/followers),5) * 100 as Percentage
from Twitch..twitchdata
where channel is not null and followers > followers_gained
order by Percentage desc

--Top 15 channels with the most followers who speak English
select top 15 channel, followers
from Twitch..twitchdata
where language = 'English'
order by followers desc;

--The top 15 channels with the most followers are those that do not speak English.
select top 15 channel, followers, language 
from Twitch..twitchdata
where language != 'English'
order by followers desc;

--Some information about channels which do not have a partnership with Twitch and times are measured in minutes
select count(channel) as Channels, sum(followers) Followers, sum(stream_time) as Streaming_time,
avg(watch_time) as Average_watch_time,avg(peak_viewers) as Average_peak_viewers
from Twitch..twitchdata
where channel is not null and partnered !=1;

--Platform advancements in numbers
select year, sum(Avg_channels) as Channels, sum(Streams) as Streams, 
sum(Games_streamed) as Games,sum(hours_watched) as Hours_watched
from Twitch..twitch_global_data
group by year
order by Channels asc;

--Top 12 months in terms of watching and interaction
select top 12 year, month, hours_watched 
from Twitch..twitch_global_data
order by hours_watched desc;

--Show top 6 months in terms of the number of Streamer production   
select top 6 year, month, Streams, Games_streamed, Hours_watched
from Twitch..twitch_global_data
--group by year 
order by streams desc;

--Show top 6 months in terms of the number of active users on the platform.
select  top 6 year, Month, Peak_viewers
from Twitch..twitch_global_data
order by Peak_viewers desc;

--Show the best and least months in terms of the number of active users on the platform.
select Month, sum(Peak_viewers) as Peak_viewers
from Twitch..twitch_global_data
group by Month
order by Peak_viewers asc;

--Average Games numbers over the years 
select year, avg(Games_streamed) as Average_Games
from Twitch..twitch_global_data
group by year
order by Average_Games asc;

--showing platform viewers numbers  over the months, from the lowest to the highest.
select Month, sum(Avg_viewers) as Viewers  
from Twitch..twitch_global_data
group by Month
order by Viewers asc;

--Top viewed games and streaming hours
select top 5 Game, Hours_watched, Hours_Streamed
from (
select  Game, sum(Hours_watched) as Hours_watched, sum(Hours_Streamed) as Hours_Streamed 
from Twitch..games_data
group by Game ) as Temp
where Game != 'Just Chatting'
order by Hours_watched desc;

--Popular Games among streamers 
select top 8 Game, sum(Hours_Streamed) as Hours_Streamed
from Twitch..games_data
group by Game
order by Hours_Streamed desc

--Peak viewers numbers 
select top 20 Game, avg(Peak_viewers) as Average_Peak_viewers
from Twitch..games_data
group by Game
order by Average_Peak_viewers desc;

--Numbers of real followers for games over years 
select Game, sum(Avg_viewers) as viewers
from Twitch..games_data
group by Game
order by viewers desc;

--Top viewed games and streaming hours in 2021
select top 5 Year, Game , Hours_Streamed,Hours_watched 
from (
select  Year, Game,sum(Hours_Streamed) as Hours_Streamed, sum(Hours_watched) as Hours_watched 
from Twitch..games_data
group by Year ,Game
) as Temp
where Year = 2021 and Game != 'Just Chatting'
order by Hours_Streamed desc;
