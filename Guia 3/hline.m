function hline(t, valor, color, etiqueta)
  line([t(1) t(end)], [valor valor], 'Color', color, 'LineStyle', '--', 'DisplayName', etiqueta);
end
