% Automatisch generiert — Thema: Nuclear Energy
% arg/1 Fakten
arg(pro1).  % [pro] Nuclear power generates large amounts of electricity with minimal greenhouse gas emissions.
arg(pro2).  % [pro] Modern reactor designs have enhanced safety features that significantly reduce accident risk.
arg(pro3).  % [pro] Nuclear energy provides a reliable baseload power source independent of weather conditions.
arg(pro4).  % [pro] The high energy density of nuclear fuel means less land is needed compared to renewables.
arg(pro5).  % [pro] Nuclear plants can help stabilize electricity grids that incorporate intermittent renewable sources.
arg(pro6).  % [pro] Advanced fuel cycles can extract more energy from uranium and reduce waste volume.
arg(pro7).  % [pro] Nuclear energy supports energy security by reducing dependence on imported fossil fuels.
arg(con1).  % [con] Nuclear accidents, though rare, can cause catastrophic environmental and human health impacts.
arg(con2).  % [con] Long‑term management of radioactive waste remains an unsolved technical and political challenge.
arg(con3).  % [con] High capital costs and long construction times make nuclear projects financially risky.
arg(con4).  % [con] Nuclear facilities can be attractive targets for terrorism or proliferation of weapons‑grade material.
arg(con5).  % [con] Decommissioning old reactors is expensive and can take decades to complete safely.
arg(con6).  % [con] Public opposition and mistrust often delay or block nuclear plant development.
arg(con7).  % [con] The mining and processing of uranium have significant ecological and social consequences.

% att/2 Fakten  (Angriff-Relationen nach Dung 1995)
att(con7, pro1).
att(pro2, con1).
att(con1, pro2).
att(con4, pro3).
att(con6, pro3).
att(con2, pro5).
att(con3, pro5).
att(con2, pro6).
att(con3, pro7).
att(con4, pro7).
att(con6, pro7).