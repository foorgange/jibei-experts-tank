package com.jd.tecachieve.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jd.tecachieve.domain.TecVerticaltopic;
import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.domain.Tecpi;
import com.jd.tecachieve.domain.Tecteam;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TecachievementVO extends Tecachievement {
    private List<Tecteam> tecTeamList;

    private Tecpi tecpi;

    private List<TecVerticaltopic> tecVerticaltopicList;

    private TecVerticaltopic tecVerticaltopic;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
}
