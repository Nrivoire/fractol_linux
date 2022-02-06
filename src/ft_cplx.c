/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   ft_cplx.c                                        .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: nrivoire <nrivoire@student.le-101.fr>      +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2019/08/07 00:59:28 by nrivoire     #+#   ##    ##    #+#       */
/*   Updated: 2019/09/03 15:40:12 by nrivoire    ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../includes/fractol.h"

t_cplx		ft_cplx(t_env *v, int x, int y)
{
	t_cplx	cplx;

	cplx.real = map(x, data_mapping(0, WIDTH, v->x, v->x + 4 / v->zoom));
	cplx.im = map(y, data_mapping(0, HEIGHT, v->y, v->y + 4 / v->zoom));
	return (cplx);
}
