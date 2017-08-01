package com.fxb.jeesite.modules.dm.entity;

import java.util.List;

/**
 * @create by: wangxiyue on 2017/7/31 18:10.
 * @ClassName: Affairs
 * @userfor: 今日时讯-VO
 * @description: 统计今日考试练车，明日考试练车
 */
public class Affairs {
    private List<Exam> examsToday;
    private List<Train> trainsToday;
    private List<Exam> examsTomorrow;
    private List<Train> trainsTomorrow;

    public List <Exam> getExamsToday(){
        return examsToday;
    }

    public void setExamsToday(List <Exam> examsToday){
        this.examsToday=examsToday;
    }

    public List <Train> getTrainsToday(){
        return trainsToday;
    }

    public void setTrainsToday(List <Train> trainsToday){
        this.trainsToday=trainsToday;
    }

    public List <Exam> getExamsTomorrow(){
        return examsTomorrow;
    }

    public void setExamsTomorrow(List <Exam> examsTomorrow){
        this.examsTomorrow=examsTomorrow;
    }

    public List <Train> getTrainsTomorrow(){
        return trainsTomorrow;
    }

    public void setTrainsTomorrow(List <Train> trainsTomorrow){
        this.trainsTomorrow=trainsTomorrow;
    }
}
